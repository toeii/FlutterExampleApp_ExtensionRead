import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EasyListView extends StatefulWidget {

  final int itemCount;
  final WidgetBuilder headerBuilder;
  final WidgetBuilder loadMoreItemBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder dividerBuilder;
  final bool loadMore;
  final bool loadMoreWhenNoData;
  final VoidCallback onLoadMore;
  final ScrollPhysics physics;
  final ScrollController controller;
  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;
  final Widget foregroundWidget;
  final EdgeInsetsGeometry padding;
  final bool isSliverMode;
  final WidgetBuilder footerBuilder;

  EasyListView({
    @required this.itemCount,
    @required this.itemBuilder,
    this.headerBuilder,
    this.footerBuilder,
    this.loadMore = false,
    this.onLoadMore,
    this.loadMoreWhenNoData = false,
    this.loadMoreItemBuilder,
    this.dividerBuilder,
    this.physics,
    this.headerSliverBuilder,
    this.controller,
    this.foregroundWidget,
    this.padding,
    this.isSliverMode = false,
    // [Not Recommended]
    // Sliver mode will discard a lot of ListView variables (likes physics, controller),
    // and each of items must be sliver.
    // *Sliver mode will build all items when inited. (ListView item is built by lazy)*
  }) : assert(itemBuilder != null);

  @override
  State<StatefulWidget> createState() {
    return EasyListViewState();
  }


}

enum ItemType { header, footer, loadMore, data, dividerData }

class EasyListViewState extends State<EasyListView> {

  @override
  Widget build(BuildContext context) => widget.headerSliverBuilder != null
      ? NestedScrollView(
    headerSliverBuilder: widget.headerSliverBuilder,
    body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _buildList(),
    ),
  )
      : _buildList();

  Widget _itemBuilder(context, index) {
    var headerCount = _headerCount();
    var totalItemCount = _dataItemCount() + headerCount + _footerCount();
    switch (_itemType(index, totalItemCount)) {
      case ItemType.header:
        return widget.headerBuilder(context);
      case ItemType.footer:
        return widget.footerBuilder(context);
      case ItemType.loadMore:
        return _buildLoadMoreItem();
      case ItemType.dividerData:
        return _buildDividerWithData(index, index - headerCount);
      case ItemType.data:
      default:
        return widget.itemBuilder(context, index - headerCount);
    }
  }

  _buildList() {
    var headerCount = _headerCount();
    var totalItemCount = _dataItemCount() + headerCount + _footerCount();
    var children = <Widget>[
      widget.isSliverMode
          ? CustomScrollView(
        slivers: List.generate(
            totalItemCount, (index) => _itemBuilder(context, index)),
      )
          : ListView.builder(
        physics: widget.physics,
        padding: widget.padding,
        controller: widget.controller,
        itemCount: totalItemCount,
        itemBuilder: _itemBuilder,
      )
    ];
    if (widget.foregroundWidget != null) children.add(widget.foregroundWidget);
    return Stack(children: children);
  }

  ItemType _itemType(itemIndex, totalItemCount) {
    if (_isHeader(itemIndex)) {
      return ItemType.header;
    } else if (_isLoadMore(itemIndex, totalItemCount)) {
      if ((widget.loadMoreWhenNoData ||
          (!widget.loadMoreWhenNoData && widget.itemCount > 0)) &&
          widget.onLoadMore != null) {
        Timer(Duration(milliseconds: 50), widget.onLoadMore);
      }
      return ItemType.loadMore;
    } else if (_isFooter(itemIndex, totalItemCount)) {
      return ItemType.footer;
    } else if (_hasDivider()) {
      return ItemType.dividerData;
    } else {
      return ItemType.data;
    }
  }

  Widget _buildLoadMoreItem() {
    if ((widget.loadMoreWhenNoData ||
        (!widget.loadMoreWhenNoData && widget.itemCount > 0)) &&
        widget.onLoadMore != null) {
      Timer(Duration(milliseconds: 50), widget.onLoadMore);
    }
    return widget.loadMoreItemBuilder != null
        ? widget.loadMoreItemBuilder(context)
        : widget.isSliverMode
        ? SliverList(delegate: SliverChildListDelegate([_defaultLoadMore]))
        : _defaultLoadMore;
  }

  Widget _buildDividerWithData(index, dataIndex) => index.isEven
      ? widget.dividerBuilder != null
      ? widget.dividerBuilder(context, dataIndex ~/ 2)
      : widget.isSliverMode
      ? SliverList(delegate: SliverChildListDelegate([_defaultDivider]))
      : _defaultDivider
      : widget.itemBuilder(context, dataIndex ~/ 2);

  bool _isHeader(itemIndex) => _hasHeader() && itemIndex == 0;

  bool _isLoadMore(itemIndex, total) =>
      widget.loadMore && itemIndex == total - 1;

  bool _isFooter(itemIndex, total) => _hasFooter() && itemIndex == total - 1;

  int _headerCount() => _hasHeader() ? 1 : 0;

  int _footerCount() => (_hasFooter() || widget.loadMore) ? 1 : 0;

  int _dataItemCount() =>
      _hasDivider() ? widget.itemCount * 2 - 1 : widget.itemCount;

  bool _hasDivider() => widget.dividerBuilder != null;

  bool _hasHeader() => widget.headerBuilder != null;

  bool _hasFooter() => widget.footerBuilder != null;

  final _defaultLoadMore = Container(
    padding: const EdgeInsets.all(4.0),
    child: const Center(
        child: const CircularProgressIndicator(),
    ),
  );

  final _defaultDivider = const Divider(color: Colors.grey);


}

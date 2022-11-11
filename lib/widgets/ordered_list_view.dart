import 'package:flutter/material.dart';

class OrderedListView extends StatefulWidget {
  final List<Widget> children;
  const OrderedListView({
    super.key,
    required this.children,
  });

  @override
  State<OrderedListView> createState() => _OrderedListViewState();
}

class _OrderedListViewState extends State<OrderedListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: widget.children);
  }
}

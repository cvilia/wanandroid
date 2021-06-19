import 'package:flutter/material.dart';

class KeepAliveManager extends StatefulWidget {
  final Widget child;

  const KeepAliveManager({Key? key, required this.child}) : super(key: key);

  @override
  _KeepAliveManagerState createState() => _KeepAliveManagerState();
}

class _KeepAliveManagerState extends State<KeepAliveManager> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }


  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';

import '../main.dart';

class RefreshOnReturn extends StatefulWidget {
  final Widget child;
  final VoidCallback onRefresh;

  const RefreshOnReturn({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  _RefreshOnReturnState createState() => _RefreshOnReturnState();
}

class _RefreshOnReturnState extends State<RefreshOnReturn> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    widget.onRefresh(); // 👈 Called when coming back
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';
import '../../main.dart';


class ScreenProtectWrapper extends StatefulWidget {
  final Widget child;
  const ScreenProtectWrapper({super.key, required this.child});

  @override
  State<ScreenProtectWrapper> createState() => _ScreenProtectWrapperState();
}

class _ScreenProtectWrapperState extends State<ScreenProtectWrapper> with RouteAware {
  @override
  void initState() {
    super.initState();
    _enableProtection();
  }

  void _enableProtection() async {
    await ScreenProtector.preventScreenshotOn();
    await ScreenProtector.protectDataLeakageOn();
  }

  void _disableProtection() async {
    await ScreenProtector.preventScreenshotOff();
    await ScreenProtector.protectDataLeakageOff();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    _disableProtection();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _enableProtection();
  }

  @override
  void didPopNext() {
    _enableProtection();
  }

  @override
  void didPushNext() {
    _disableProtection();
  }

  @override
  void didPop() {
    _disableProtection();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

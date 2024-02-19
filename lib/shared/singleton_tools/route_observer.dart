import 'package:flutter/material.dart';

class GloboRouteObserver extends NavigatorObserver {
  static final GloboRouteObserver _singleton = GloboRouteObserver._internal();

  factory GloboRouteObserver() {
    return _singleton;
  }

  GloboRouteObserver._internal();

  String? currentRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    currentRoute = route.settings.name;
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    currentRoute = previousRoute?.settings.name;
    super.didPop(route, previousRoute);
  }

  // Implement didReplace and didRemove if needed
}
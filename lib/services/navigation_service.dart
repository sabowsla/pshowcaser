import 'package:flutter/material.dart';
import 'package:pshowcaser/di/locator.dart';
import 'package:pshowcaser/services/routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  static NavigationService get _service => locator<NavigationService>();

  static Future<void> toHomeRoute() async {
    await navigateTo(HomeRoute);
  }

  static Future<void> navigateTo(String route) async {
    await _service.pushNamed(route);
  }
}

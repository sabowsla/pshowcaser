import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pshowcaser/pages/about_page.dart';
import 'package:pshowcaser/pages/contact_page.dart';
import 'package:pshowcaser/pages/news_page.dart';

import '../extensions/extensions.dart';
import '../pages/a_export_pages.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  RoutingData routingData = settings.name!.getRoutingData;
  log("Going to route ${routingData.route}");
  switch (routingData.route) {
    case HomeRoute:
      return _getPageRoute(const HomePage(), settings);
    case GamesRoute:
      return _getPageRoute(const NewsPage(), settings);

    case AboutRoute:
      return _getPageRoute(const AboutPage(), settings);
    case ContactRoute:
      return _getPageRoute(const ContactPage(), settings);
    default:
      return _getPageRoute(const HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  _FadeRoute({required this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

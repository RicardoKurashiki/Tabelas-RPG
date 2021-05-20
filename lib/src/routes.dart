import 'package:flutter/material.dart';

import 'pages/home/home.page.dart';

class RPGPages {
  RPGPages._();

  static const Home = '/home';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  Route<dynamic> page(Widget widget) =>
      FadePageRoute(page: widget, settings: settings);

  switch (settings.name) {
    case RPGPages.Home:
      return page(HomePage());
    default:
      //Criar startup page
      return page(HomePage());
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  final Widget page;
  final RouteSettings settings;

  FadePageRoute({this.page, this.settings}) : super(settings: settings);

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      FadeTransition(opacity: animation, child: page);

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}

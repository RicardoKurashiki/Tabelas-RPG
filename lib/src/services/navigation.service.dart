import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tabela_rpg/src/routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String _checkpointPage;
  dynamic _checkpointArgument;

  void setCheckpoint(String page, [dynamic argument]) {
    _checkpointPage = page;
    _checkpointArgument = argument;
  }

  bool hasCheckpoint() => _checkpointPage != null;

  Future<dynamic> pushCheckpoint([bool replace = true]) async {
    if (_checkpointPage == null) return;
    final p = _checkpointPage;
    final a = _checkpointArgument;
    setCheckpoint(null, null);
    if (replace) return await pushReplacement(p, arguments: a);
    return await push(p, a);
  }

  Future<dynamic> pushReplacement(String pageUrl,
      {dynamic arguments, dynamic result}) {
    return navigatorKey.currentState
        .pushReplacementNamed(pageUrl, arguments: arguments, result: result);
  }

  Future<dynamic> push(String pageUrl, [dynamic arguments]) {
    return navigatorKey.currentState.pushNamed(pageUrl, arguments: arguments);
  }

  void pop([dynamic result]) {
    closeSnack();
    if (canPop()) {
      navigatorKey.currentState.maybePop(result);
    } else {
      navigatorKey.currentState
          .pushReplacementNamed(RPGPages.Home, result: result);
    }
  }

  void closeSnack() {
    if (Get.isSnackbarOpen ?? false) navigatorKey.currentState.pop();
  }

  Future<dynamic> pushAsFirst(String pageUrl, {dynamic arguments}) async {
    while (canPop()) navigatorKey.currentState.pop();
    if (Get.currentRoute == pageUrl && Get.arguments == arguments) return;
    return await navigatorKey.currentState
        .pushReplacementNamed(pageUrl, arguments: arguments);
  }

  bool canPop() => navigatorKey.currentState.canPop();
}

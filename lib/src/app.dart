import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabela_rpg/src/locators.dart';

import 'routes.dart';

class RPGApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetMaterialApp(
        title: 'Tabelas RPG',
        initialRoute: RPGPages.Home,
        onGenerateRoute: onGenerateRoute,
        navigatorKey: GetIt.I<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

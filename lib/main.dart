import 'package:flutter/material.dart';
import 'package:tabela_rpg/src/locators.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locatorSetup();
  runApp(RPGApp());
}

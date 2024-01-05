import 'package:agro_calculator/agro_app.dart';
import 'package:agro_calculator/utils/key_preferences.dart';
import 'package:flutter/material.dart';

import 'database/interface_database.dart';
import 'database/shared_preferences_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final IDataBase db = DataBasePrefs();
  await db.init();

  final bool fl = await db.get(KeyStore.isFirstLaunch.key, KeyStore.isFirstLaunch.defaultValue);


  runApp(AgroApp(isFirstLaunch: fl,));
}

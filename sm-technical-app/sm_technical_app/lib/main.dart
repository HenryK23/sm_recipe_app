import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sm_technical_app/infrastructure/router/app_router.dart';

import 'domain/constants/hiveboxconstants.dart';
import 'infrastructure/di/servicelocator.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  ServiceLocator serviceLocator = ServiceLocator();
  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  await Hive.openBox(HiveBoxConstants.recipeBox);
  runApp(MyApp(serviceLocator));
}

class MyApp extends StatefulWidget {
  final ServiceLocator _serviceLocator;
  const MyApp(this._serviceLocator, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  @override
  void initState() {
    super.initState();
    widget._serviceLocator.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Hash Slingers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

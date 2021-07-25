import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await Permission.storage.request().isGranted) {
    Directory dir = await getApplicationDocumentsDirectory();
    print(dir.path);
    await Hive.initFlutter(dir.path);
    await Hive.openBox("db");
    var dbBox = Hive.box("db");
    var token = dbBox.get("userToken");
    if (token != null) {
      runApp(
        GetMaterialApp(
          title: "Application",
          initialRoute: Routes.USER,
          getPages: AppPages.routes,
        ),
      );
    } else {
      runApp(
        GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      );
    }
  } else {
    runApp(NotWorkingApp());
  }
}

class NotWorkingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
            backgroundColor: Colors.red,
          ),
          body: Center(child: Text('You need to grant storage permission.'))
      ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetCupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan.shade900,
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
    ),
  );
}

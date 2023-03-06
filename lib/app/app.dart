import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/base/global/constants/app_colors.dart';
import 'routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      color: AppColors.primaryColor,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
    );
  }
}

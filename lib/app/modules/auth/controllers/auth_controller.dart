import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/network/firebase_connect.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final count = 0.obs;
  final passwordController = TextEditingController(),
      emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    refreshAuth();
    super.onInit();
  }

  refreshAuth() async {
    bool loggedIn = await FirebaseConnection().isLoggerIn();
    if (loggedIn) {
      Get.offAllNamed(Routes.home);
    } 
  }

  handleLogin() async {
    // if (formKey.currentState!.validate()) {
    var user = await FirebaseConnection().signInAnonymously();
    if (user != null) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: "User is unauthenticated",
        ),
      );
    }
    // }
  }

  bool isValidEmail(value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }
}

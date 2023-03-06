import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/base/global/widgets/app_elevated_button.dart';
import 'package:todo_app/app/base/global/widgets/app_text_form_field.dart';

import '../../../base/global/constants/app_colors.dart';
import '../../../base/global/constants/constants.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/bg_bl.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: AppColors.backgroundColor.withOpacity(.9),
          child: SingleChildScrollView(
            child: Container(
              padding: p20,
              height: MediaQuery.of(context).size.height * .9,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/icon.png",
                      fit: BoxFit.cover,
                      width: 180,
                      height: 180,
                    ),
                    sbH(40),
                    AppTextFormField(
                      controller: controller.emailController,
                      hintText: "Email",
                      validator: (value){
                        if(value?.isEmpty ?? false){
                          return "Enter a email address";
                        }else if(!controller.isValidEmail(value)){
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    sbH20(),
                    AppTextFormField(
                      controller: controller.passwordController,
                      hintText: "Password",
                      isPassword: true,
                      validator: (value){
                        if(value?.isEmpty ?? false){
                          return "Password is empty";
                        }else if((value?.length  ?? 99)< 6){
                          return "Enter a valid password";
                        }
                        return null;
                      },
                    ),
                    sbH20(),
                    SizedBox(
                      width: 120,
                      height: 45,
                      child: AppElevatedButton(
                        text: "Login",
                        onPressed: controller.handleLogin,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

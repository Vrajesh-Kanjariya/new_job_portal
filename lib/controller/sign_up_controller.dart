import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isCPasswordVisible = true;


  void passwordHideShow() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void cPasswordHideShow() {
    isCPasswordVisible = !isCPasswordVisible;
    update();
  }

}
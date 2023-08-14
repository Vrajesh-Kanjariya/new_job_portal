import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/utils/shared_preference.dart';

import '../services/share_preference.dart';
import '../utils/utils.dart';

class WelcomeController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  getAuthUser() async {
    isAuthUser = await getPrefBoolValue(SharedPrefService.instance.isAuthenticateUser);
    if(isAuthUser){
      gotoDashboard();
    }
  }
}

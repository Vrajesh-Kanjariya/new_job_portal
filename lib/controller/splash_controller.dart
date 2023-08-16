import 'dart:async';

import 'package:get/get.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/utils/utils.dart';

import '../services/share_preference.dart';
import '../utils/shared_preference.dart';

class SplashController extends GetxController {

  @override
  Future<void> onInit() async {
    super.onInit();
    getArguments();
  }

  getArguments() async {
   var user = await getPrefStringValue(SharedPrefService.instance.userDataKey) ?? '';
    if(user.isNotEmpty){
      logs("UserData --> $userdata");
    }
  }

  void timer() {
    Timer(const Duration(seconds: 3), () => gotoWelcome());
  }

}

import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_job_portal/model/sign_in_response.dart';
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
   String signInDataResponse = await getPrefStringValue(SharedPrefService.instance.userDataKey) ?? '';
    if(signInDataResponse.isNotEmpty){
      signInData = signInResponseFromJson(jsonDecode(signInDataResponse));
    }
  }

  void timer() {
    Timer(const Duration(seconds: 3), () => gotoWelcome());
  }

}

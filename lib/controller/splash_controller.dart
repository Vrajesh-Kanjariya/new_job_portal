import 'dart:async';

import 'package:get/get.dart';
import 'package:new_job_portal/routes/app_navigation.dart';

class SplashController extends GetxController {

  void timer() {
    Timer(const Duration(seconds: 3), () => gotoWelcome());
  }

}

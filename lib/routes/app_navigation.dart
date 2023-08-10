import 'package:get/get.dart';

import 'route_helper.dart';

gotoBack() {
  Get.back();
}

gotoInternet() {
  Get.toNamed(RouteHelper.getNoInternetRoute());
}

gotoSplash(int type) {
  Get.offAllNamed(RouteHelper.getSplashRoute());
}

gotoWelcome(){
  Get.offAllNamed(RouteHelper.getWelcomeRoute());
}

gotoSignIn(){
  Get.offNamed(RouteHelper.getSignInRoute());
}

gotoSignUp(){
  Get.offNamed(RouteHelper.getSignUpRoute());
}


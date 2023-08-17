import 'package:get/get.dart';
import 'package:new_job_portal/model/get_job_response.dart';

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

gotoDashboard(){
  Get.offAllNamed(RouteHelper.getDashboardRoute());
}

gotoHome(){
  Get.toNamed(RouteHelper.getHomeRoute());
}

gotoFilter(){
  Get.toNamed(RouteHelper.getFilterRoute());
}

gotoFavourite(){
  Get.toNamed(RouteHelper.getFilterRoute());
}

gotoProfile(){
  Get.toNamed(RouteHelper.getProfileRoute());
}

gotoJobDetails(Job job){
  Get.toNamed(RouteHelper.getJobDetailsRoute(),arguments: {'Job':job});
}

gotoFilterList(List<Job>? jobList){
  Get.toNamed(RouteHelper.getFilterListRoute(), arguments: {'Job':jobList});
}

gotoChangePassword(){
  Get.toNamed(RouteHelper.getChangePasswordRoute());
}
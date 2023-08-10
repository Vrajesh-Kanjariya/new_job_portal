import 'package:get/get.dart';
import 'package:new_job_portal/pages/welcome/welcome_page.dart';
import 'package:new_job_portal/routes/route_constant.dart';


import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../pages/splash/splash_page.dart';
import '../widgets/no_internet_connection.dart';



class RouteHelper {
  static String getNoInternetRoute() => RouteConstant.noInternet;
  static String getSplashRoute() => RouteConstant.splash;
  static String getWelcomeRoute() => RouteConstant.welcome;
  static String getSignInRoute() => RouteConstant.signIn;
  static String getSignUpRoute() => RouteConstant.signUp;


  static List<GetPage> routes = [
    GetPage(name: RouteConstant.noInternet, page: () => const NoInternetConnection()),
    GetPage(name: RouteConstant.splash, page: () => const SplashPage()),
    GetPage(name: RouteConstant.welcome, page: () => const WelcomePage()),
    GetPage(name: RouteConstant.signIn, page: () => const SignInPage()),
    GetPage(name: RouteConstant.signUp, page: () => const SignUpPage()),
  ];
}

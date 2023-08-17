import 'package:get/get.dart';
import 'package:new_job_portal/pages/change_password_page.dart';
import 'package:new_job_portal/pages/filter_list_page.dart';
import 'package:new_job_portal/pages/job_details_page.dart';

import '../pages/welcome_page.dart';
import '../../routes/route_constant.dart';
import '../pages/dashboard_page.dart';
import '../pages/favourite_page.dart';
import '../pages/filter_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/sign_in_page.dart';
import '../pages/sign_up_page.dart';
import '../pages/splash_page.dart';
import '../widgets/no_internet_connection.dart';

class RouteHelper {
  static String getNoInternetRoute() => RouteConstant.noInternet;
  static String getSplashRoute() => RouteConstant.splash;
  static String getWelcomeRoute() => RouteConstant.welcome;
  static String getSignInRoute() => RouteConstant.signIn;
  static String getSignUpRoute() => RouteConstant.signUp;
  static String getDashboardRoute() => RouteConstant.dashboard;
  static String getHomeRoute() => RouteConstant.home;
  static String getFilterRoute() => RouteConstant.filter;
  static String getFavouriteRoute() => RouteConstant.favourite;
  static String getProfileRoute() => RouteConstant.profile;
  static String getJobDetailsRoute() => RouteConstant.jobDetails;
  static String getFilterListRoute() => RouteConstant.filterList;
  static String getChangePasswordRoute() => RouteConstant.changePassword;

  static List<GetPage> routes = [
    GetPage(name: RouteConstant.noInternet, page: () => const NoInternetConnection()),
    GetPage(name: RouteConstant.splash, page: () => const SplashPage()),
    GetPage(name: RouteConstant.welcome, page: () => const WelcomePage()),
    GetPage(name: RouteConstant.signIn, page: () => const SignInPage()),
    GetPage(name: RouteConstant.signUp, page: () => const SignUpPage()),
    GetPage(name: RouteConstant.dashboard, page: () => const DashboardPage()),
    GetPage(name: RouteConstant.home, page: () => const HomePage()),
    GetPage(name: RouteConstant.filter, page: () => const FilterPage()),
    GetPage(name: RouteConstant.favourite, page: () => const FavouritePage()),
    GetPage(name: RouteConstant.profile, page: () => const ProfilePage()),
    GetPage(name: RouteConstant.jobDetails, page: () => const JobDetailsPage()),
    GetPage(name: RouteConstant.filterList, page: () => const FilterListPage()),
    GetPage(name: RouteConstant.changePassword, page: () => const ChangePasswordPage()),
  ];
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/routes/route_helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/app_theme.dart';
import '../constant/string_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // List<SingleChildWidget> providers = [
  //   ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  // ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation, screenType) {
          return GetMaterialApp(
            builder: BotToastInit(),
            title: StringConstant.appTitle,
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            initialRoute: RouteHelper.getHomeRoute(),
            navigatorObservers: [BotToastNavigatorObserver()],
            getPages: RouteHelper.routes,
            theme: AppTheme.themeData,
            scrollBehavior: MyBehavior(),
            //defaultTransition: Transition.downToUp, // MAKE fullscreenDialog false to allow this animation
            transitionDuration: const Duration(milliseconds: 1000),
          );
        }
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/string_constant.dart';
import 'package:new_job_portal/routes/route_helper.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/widgets/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, screenType) {
        return GetMaterialApp(
          builder: BotToastInit(),
          title: StringConstant.appTitle,
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.getSplashRoute(),
          navigatorObservers: [BotToastNavigatorObserver()],
          getPages: RouteHelper.routes,
          theme: AppTheme.themeData,
          scrollBehavior: MyBehavior(),
          defaultTransition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 1000),
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}

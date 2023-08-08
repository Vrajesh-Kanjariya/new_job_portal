import 'package:flutter/material.dart';
import 'package:new_job_portal/pages/splash/splash_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../widgets/app_theme.dart';
import '../constant/string_constant.dart';
import '../../../pages/splash/splash_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation, screenType) {
          return MultiProvider(
            providers: providers,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: StringConstant.appTitle,
              theme: AppTheme.themeData,
              // home: const WelcomeScreen(),
              home: const SplashPage(),
            ),
          );
        }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constant/color_constant.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ColorConstant.themeScaffold.withOpacity(0.8),
        child: const SpinKitCircle(color: ColorConstant.darkBlue, size: 42),
      ),
    );
  }
}

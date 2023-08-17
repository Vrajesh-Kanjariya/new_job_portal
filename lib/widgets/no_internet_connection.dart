import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/image_constant.dart';
import '../../utils/shared_preference.dart';
import '../../widgets/app_image_assets.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_theme.dart';
import '../constant/color_constant.dart';
import '../constant/string_constant.dart';
import '../services/connectivity_service.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.appWhite,
        bottomNavigationBar: GestureDetector(
          onTap: () async {
            bool isConnect = await ConnectivityService.instance.isConnectNetworkWithMessage();
            if (isConnect) {
              if (await getPrefBoolValue(isUserLoginKey)) {
                // goToHome();
              } else {
                // gotoSignIn();
              }
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: 45.px,
                width: 175.px,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.px)),
                  color: ColorConstant.primary,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 28.px,
                    fontFamily: AppTheme.defaultFont,
                    fontWeight: FontWeight.w700,
                  ),
                  child: const AppText(
                    text: StringConstant.refresh,
                  ),
                ),
              ),
              SizedBox(height: 30.px)
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.px),
              AppImageAsset(
                image: ImageConstant.network,
                height: 200.px,
                width: 200.px,
              ),
              DefaultTextStyle(
                  style: const TextStyle(),
                  child: AppText(
                    text: StringConstant.noInternet,
                    fontColor: ColorConstant.appBlack,
                    fontSize: 20.px,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 10.px),
              DefaultTextStyle(
                style: const TextStyle(),
                child: AppText(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  text: StringConstant.noInternetMsg,
                  fontColor: const Color(0xff787878),
                  fontSize: 15.px,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15.px),
              Divider(
                endIndent: 40.px,
                thickness: 1.px,
                indent: 40.px,
                color: const Color(0xffCBCBCB),
              ),
              SizedBox(height: 18.px),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/color_constant.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/widgets/app_image_assets.dart';
import 'package:new_job_portal/widgets/app_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppAppBar extends PreferredSize {
  final double? appBarHeight;
  final String appbarTitle;
  final GestureTapCallback? onTapBack;
  final Color appBarColor;
  final String leftIcon;
  final double titleFontSize;
  final Color leftIconColor;
  final Color rightIconColor;
  final GestureTapCallback? rightIconTap;
  final double leftIconHeight;
  final double rightIconHeight;
  final bool isRightIcon;
  final String? rightIcon;

  AppAppBar({
    Key? key,
    this.appBarHeight,
    this.appbarTitle = 'LOGO',
    this.onTapBack,
    this.leftIconHeight = 20,
    this.rightIconHeight = 20,
    this.titleFontSize = 15,
    this.rightIconTap,
    this.leftIconColor = ColorConstant.appBlack,
    this.rightIconColor = ColorConstant.appBlack,
    this.leftIcon = ImageConstant.backIcon,
    this.appBarColor = ColorConstant.appWhite,
    this.isRightIcon = false,
    this.rightIcon,
    Widget? child,
    Size? preferredSize,
  }) : super(
          key: key,
          child: Container(),
          preferredSize: Size.fromHeight(appBarHeight ?? 55.px),
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: appBarColor,
        ),
        height: 68.px,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: AppImageAsset(
                image: leftIcon,
                height: leftIconHeight.px,
                width: leftIconHeight.px,
                color: leftIconColor,
              ),
            ),
            const Spacer(),
            AppText(
              text: appbarTitle,
              fontColor: leftIconColor,
              fontSize: titleFontSize.px,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (isRightIcon)
              GestureDetector(
                onTap: rightIconTap,
                child: Container(
                  alignment: Alignment.center,
                  child: AppImageAsset(
                    image: rightIcon ?? ImageConstant.appLogo,
                    height: rightIconHeight,
                    width: rightIconHeight,
                    color: rightIconColor,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

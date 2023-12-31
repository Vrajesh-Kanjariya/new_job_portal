import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/constant/string_constant.dart';
import 'package:new_job_portal/controller/profile_controller.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/widgets/app_image_assets.dart';
import 'package:new_job_portal/widgets/app_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/color_constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return Scaffold(appBar: appBar(), body: _profileBody());
      },
    );
  }

  appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: AppText(
        text: 'Profile'.toUpperCase(),
        fontSize: 16.px,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  _profileBody() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProfileView(),
          buildProfileDetailsView(),
        ],
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 60.px,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80.px),
            child: AppImageAsset(
              image: ImageConstant.userAvatar,
              isWebImage: true,
              width: 180.px,
              height: 180.px,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 12.px),
        AppText(
          text: 'Job Portal',
          fontColor: ColorConstant.appBlack,
          fontSize: 22.px,
          fontWeight: FontWeight.bold,
        ),
        AppText(
          text: 'Junior product designer',
          fontColor: ColorConstant.textGrey,
          fontSize: 16.px,
        ),
        SizedBox(height: 12.px),
      ],
    );
  }

  buildProfileDetailsView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.px),
      color: ColorConstant.whiteBg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.px, vertical: 5.px),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                      child: Column(
                        children: [
                          AppImageAsset(
                            image: ImageConstant.customer,
                            width: 30.px,
                            height: 30.px,
                          ),
                          SizedBox(height: 16.px),
                          AppText(
                            text: 'Set your \n profile details',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontColor: ColorConstant.appBlack,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 16.px),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
                            decoration: BoxDecoration(
                                color: ColorConstant.blueText,
                                borderRadius: BorderRadius.circular(10.px)),
                            child: const AppText(
                              text: 'Continue',
                              fontColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.px, vertical: 5.px),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                      child: Column(
                        children: [
                          AppImageAsset(
                            image: ImageConstant.customer,
                            width: 30.px,
                            height: 30.px,
                          ),
                          SizedBox(height: 16.px),
                          AppText(
                            text: 'Change your \n password',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontColor: ColorConstant.appBlack,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 16.px),
                          GestureDetector(
                            onTap: () => gotoChangePassword(),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
                              decoration: BoxDecoration(
                                  color: ColorConstant.blueText,
                                  borderRadius: BorderRadius.circular(10.px)),
                              child: const AppText(
                                text: 'Continue',
                                fontColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    Icon(Icons.tv, size: 24.px),
                    SizedBox(width: 12.px),
                    const AppText(text: 'Saved Job'),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    AppImageAsset(
                      image: ImageConstant.mapMarker,
                      width: 24.px,
                      height: 24.px,
                    ),
                    SizedBox(width: 12.px),
                    const AppText(text: 'Applied Job'),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    AppImageAsset(
                      image: ImageConstant.mapMarker,
                      width: 24.px,
                      height: 24.px,
                    ),
                    SizedBox(width: 12.px),
                    const AppText(text: 'Edit Profile'),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => gotoChangePassword(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                  padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                  child: Row(
                    children: [
                      AppImageAsset(
                        image: ImageConstant.mapMarker,
                        width: 24.px,
                        height: 24.px,
                      ),
                      SizedBox(width: 12.px),
                      const AppText(text: 'Change Password'),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    AppImageAsset(
                      image: ImageConstant.mapMarker,
                      width: 24.px,
                      height: 24.px,
                    ),
                    SizedBox(width: 12.px),
                    const AppText(text: 'Delete Account'),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    AppImageAsset(
                      image: ImageConstant.mapMarker,
                      width: 24.px,
                      height: 24.px,
                    ),
                    SizedBox(width: 12.px),
                    const AppText(text: 'Log Out'),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/constant/string_constant.dart';
import 'package:new_job_portal/controller/profile_controller.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/utils/utils.dart';
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
        return Scaffold(appBar: appBar(), body: _profileBody(),
        backgroundColor: ColorConstant.whiteBg,);
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
      child: ListView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          buildProfileView(),
          buildProfileDetailsView(),
        ],
      ),
    );
  }

  Container buildProfileView() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 60.px,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.px),
              child: AppImageAsset(
                image: '${ImageConstant.baseUrl}${signInData!.userdata!.path}',
                isWebImage: true,
                width: 180.px,
                height: 180.px,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.px),
          AppText(
            text: signInData!.userdata!.fname!.toUpperCase(),
            fontColor: ColorConstant.appBlack,
            fontSize: 18.px,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 2.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.px),
            child: AppText(
              text: signInData!.userdata!.skill,
              fontColor: ColorConstant.textGrey,
              maxLines: 3,
              textAlign: TextAlign.center,
              fontSize: 14.px,
            ),
          ),
          SizedBox(height: 12.px),
        ],
      ),
    );
  }

  buildProfileDetailsView() {
    return Column(
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
                          image: ImageConstant.user,
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
                          image: ImageConstant.password,
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
          primary: true,
          physics: const BouncingScrollPhysics(),
          children: [
            listItemView(ImageConstant.mapMarker,'Saved Job'),
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
              child: Container(
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
            ),
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
              child: Container(
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
    );
  }

  listItemView(String icon, String title) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
        decoration:
        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
        child: Row(
          children: [
            AppImageAsset(
              image: icon,
              width: 24.px,
              height: 24.px,
            ),
            SizedBox(width: 12.px),
            AppText(text: title),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
          ],
        ),
      ),
    );
  }
}

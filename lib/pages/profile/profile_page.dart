import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/constant/string_constant.dart';
import 'package:new_job_portal/controller/profile_controller.dart';
import 'package:new_job_portal/widgets/app_image_assets.dart';
import 'package:new_job_portal/widgets/app_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color_constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return Scaffold(body: _profileBody());
      },
    );
  }

  _profileBody() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 56.px,
            width: Device.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Center(
                  child: AppText(
                    text: StringConstant.profile.toUpperCase(),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.px,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(14.px),
                  child: AppImageAsset(
                    image: ImageConstant.setting,
                    width: 30.px,
                    height: 30.px,
                  ),
                ),
              ],
            ),
          ),
          buildProfileView(),
          buildProfileDetailsView(),
        ],
      ),
    );
  }

  Column buildProfileView() {
    return Column(
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
      color: const Color(0xFFFAFAFA),
      child: Column(
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
                      padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                      child: Column(
                        children: [
                          AppImageAsset(
                            image: ImageConstant.customer,
                            width: 30.px,
                            height: 30.px,
                          ),
                          SizedBox(height: 8.px),
                          AppText(
                            text: 'Set your \n profile details',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontColor: ColorConstant.appBlack,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 8.px),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
                            decoration: BoxDecoration(
                                color: ColorConstant.blueText, borderRadius: BorderRadius.circular(10.px)),
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
                      padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                      child: Column(
                        children: [
                          AppImageAsset(
                            image: ImageConstant.customer,
                            width: 30.px,
                            height: 30.px,
                          ),
                          SizedBox(height: 8.px),
                          AppText(
                            text: 'Upload your \n resume',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontColor: ColorConstant.appBlack,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 8.px),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
                            decoration: BoxDecoration(
                                color: ColorConstant.blueText, borderRadius: BorderRadius.circular(10.px)),
                            child: const AppText(
                              text: 'Continue',
                              fontColor: Colors.white,
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
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    Icon(Icons.tv, size: 24.px),
                    SizedBox(width: 12.px),
                    const AppText(text: 'My Activity'),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 24.px),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.px)),
                child: Row(
                  children: [
                    AppImageAsset(
                      image: ImageConstant.mapMarker,
                      width: 24.px,
                      height: 24.px,
                    ),
                    SizedBox(width: 12.px),
                    const AppText(text: 'My Location'),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/controller/favourite_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/color_constant.dart';
import '../constant/image_constant.dart';
import '../routes/app_navigation.dart';
import '../widgets/app_image_assets.dart';
import '../widgets/app_loader.dart';
import '../widgets/app_text.dart';
import '../widgets/app_theme.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      initState: (state) {
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            FavouriteController controller = Get.find<FavouriteController>();
            controller.getSavedJobs();
          },
        );
      },
      builder: (FavouriteController controller) {
        return Scaffold(
          appBar: appBar(),
          body: _favouriteBody(controller),
          backgroundColor: ColorConstant.whiteBg,
        );
      },
    );
  }

  appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: AppText(
        text: 'Favourite Job'.toUpperCase(),
        fontSize: 16.px,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  _favouriteBody(FavouriteController controller) {
    return Stack(
      children: [
        if (controller.saveJobListResponse != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.px),
            child: ListView.builder(
              itemCount: controller.saveJobListResponse!.savedJobs!.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => gotoJobDetails(controller.saveJobListResponse!.savedJobs![index]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.px),
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.px),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.px),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppImageAsset(
                                  image: '${ImageConstant.baseUrl}${controller.saveJobListResponse!.savedJobs![index].company!.first.logo}',
                                  isWebImage: true,
                                  height: 60.px,
                                  width: 60.px,
                                ),
                                SizedBox(
                                  width: 12.px,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text:
                                            controller.saveJobListResponse!.savedJobs![index].title,
                                        fontSize: 16.px,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 2,
                                        fontColor: ColorConstant.appBlack,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      AppText(
                                        text: controller.saveJobListResponse!.savedJobs![index]
                                            .company!.first.companyName,
                                        fontSize: 14.px,
                                        fontColor: ColorConstant.textGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.px,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                              decoration: BoxDecoration(
                                color: ColorConstant.chipsBg,
                                borderRadius: BorderRadius.circular(16.px),
                              ),
                              child: AppText(
                                text: controller.saveJobListResponse!.savedJobs![index].jobType,
                                fontColor: ColorConstant.chipsText,
                                fontSize: 13.px,
                              ),
                            ),
                            SizedBox(
                              height: 12.px,
                            ),
                            Row(
                              children: [
                                AppImageAsset(
                                  image: ImageConstant.mapMarker,
                                  width: 16.px,
                                  height: 16.px,
                                ),
                                SizedBox(
                                  width: 5.px,
                                ),
                                AppText(
                                  text:
                                      '${controller.saveJobListResponse!.savedJobs![index].city}, '
                                          '${controller.saveJobListResponse!.savedJobs![index].country}',
                                  fontSize: 14.px,
                                ),
                                const Spacer(),
                                Text.rich(
                                  TextSpan(
                                    text: controller.saveJobListResponse!.savedJobs![index].salary,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorConstant.blueText,
                                        fontFamily: AppTheme.defaultFont,
                                        fontSize: 20.0),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '/ mo',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorConstant.appBlack,
                                              fontFamily: AppTheme.defaultFont,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        controller.isLoading ? const AppLoader() : const SizedBox(),
      ],
    );
  }
}

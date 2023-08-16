import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/color_constant.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/controller/home_controller.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/widgets/app_image_assets.dart';
import 'package:new_job_portal/widgets/app_loader.dart';
import 'package:new_job_portal/widgets/app_text.dart';
import 'package:new_job_portal/widgets/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (state) {
        Future.delayed(const Duration(milliseconds: 300),() {
          HomeController controller = Get.find<HomeController>();
          controller.getJobs();
        },);
      },
      builder: (HomeController controller) {
        return Scaffold(
          body: _homeBody(controller),
        );
      },
    );
  }

  _homeBody(HomeController controller) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16.px,
                ),
                AppImageAsset(
                  image: ImageConstant.logo,
                  width: 100.px,
                ),
                SizedBox(
                  height: 16.px,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
                    hintText: 'Search job, company, city',
                    hintStyle: TextStyle(fontSize: 14.px, color: Colors.grey),
                    filled: true,
                    fillColor: ColorConstant.filledColor,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 2.px),
                      child: const AppImageAsset(
                        image: ImageConstant.search,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 24.px, maxHeight: 24.px),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 2.px),
                      child: const AppImageAsset(
                        image: ImageConstant.filter,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(minWidth: 24.px, maxHeight: 24.px),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z, ]'))],
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 16.px,
                ),
                if(controller.getJobResponse != null)Expanded(
                  child: ListView.builder(
                    itemCount: controller.getJobResponse!.jobs!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => gotoJobDetails(controller.getJobResponse!.jobs![index]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.px),
                          child: Card(
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
                                        image: ImageConstant.userAvatar,
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
                                              text: controller.getJobResponse!.jobs![index].title,
                                              fontSize: 18.px,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 2,
                                              fontColor: ColorConstant.appBlack,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            AppText(
                                              text: controller.getJobResponse!.jobs![index].company!.first.companyName,
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
                                      text: controller.getJobResponse!.jobs![index].jobType,
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
                                        text: '${controller.getJobResponse!.jobs![index].city}, ${controller.getJobResponse!.jobs![index].country}',
                                        fontSize: 14.px,
                                      ),
                                      const Spacer(),
                                      Text.rich(
                                        TextSpan(
                                          text: controller.getJobResponse!.jobs![index].salary,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: ColorConstant.blueText,
                                              fontFamily: AppTheme.defaultFont,
                                            fontSize: 20.0
                                          ),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: '/ mo',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorConstant.appBlack,
                                                  fontFamily: AppTheme.defaultFont,
                                                  fontSize: 16.0
                                                )
                                            ),
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
              ],
            ),
          ),
        ),
        controller.isLoading ? const AppLoader() : const SizedBox(),
      ],
    );
  }
}

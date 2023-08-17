import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/color_constant.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/controller/job_details_controller.dart';
import 'package:new_job_portal/widgets/app_app_bar.dart';
import 'package:new_job_portal/widgets/app_elevated_button.dart';
import 'package:new_job_portal/widgets/app_image_assets.dart';
import 'package:new_job_portal/widgets/app_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: JobDetailsController(),
        builder: (JobDetailsController jobDetailsController) {
          return Scaffold(
            appBar: appBar(jobDetailsController),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              children: [
                appLogoView(jobDetailsController),
                AppText(
                  text: jobDetailsController.job!.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 8),
                AppText(
                  text: jobDetailsController.job!.company!.first.companyName,
                  textAlign: TextAlign.center,
                  fontColor: ColorConstant.appgrey,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppImageAsset(image: ImageConstant.mapMarker),
                    const SizedBox(width: 5),
                    AppText(
                      text: '${jobDetailsController.job!.address}',
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      fontColor: ColorConstant.appBlack.withOpacity(0.5),
                    ),
                    // Container(
                    //   height: 35,
                    //   width: 60,
                    //   margin: const EdgeInsets.only(left: 10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: ColorConstant.appLightBlue,
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: const AppText(
                    //     text: 'Senior',
                    //     fontColor: ColorConstant.appBlue,
                    //     fontSize: 11,
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: ColorConstant.appgrey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      jobDetailsView(image: ImageConstant.email, title: 'Applicant', subTitle: '100'),
                      jobDetailsView(image: ImageConstant.email, title: 'Job Type', subTitle: jobDetailsController.job!.jobType!),
                      jobDetailsView(image: ImageConstant.email, title: 'Salaries', subTitle: jobDetailsController.job!.salary!),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      bool isSelected = jobDetailsController.selectedIndex == index;
                      return GestureDetector(
                        onTap: () => jobDetailsController.selectJobDetails(index),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: isSelected ? null : Border.all(color: ColorConstant.appgrey),
                              color: isSelected ? ColorConstant.appBlack : ColorConstant.appWhite),
                          child: AppText(
                            text: jobDetailsController.jobDetailsList[index]['title'],
                            fontColor: isSelected ? ColorConstant.appWhite : ColorConstant.appgrey,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemCount: jobDetailsController.jobDetailsList.length,
                  ),
                ),
                if (jobDetailsController.selectedIndex == 0) descriptionDetailsView(jobDetailsController),
                if (jobDetailsController.selectedIndex == 1) mapView(),
                if (jobDetailsController.selectedIndex == 2) companyView(),
                if (jobDetailsController.selectedIndex == 3) reviewView(),
              ],
            ),
            bottomNavigationBar: const AppElevatedButton(text: 'Apply Now', margin: 15),
          );
        });
  }

  appBar(JobDetailsController jobDetailsController) {
    return AppAppBar(
      appbarTitle: 'Job detail'.toUpperCase(),
      titleFontSize: 14,
      isRightIcon: true,
      rightIcon: jobDetailsController.isFavourite ? ImageConstant.saveFill : ImageConstant.save,
      rightIconTap: () => jobDetailsController.saveUnSaveJobs(jobDetailsController.job!.jobId),
    );
  }

  appLogoView(JobDetailsController jobDetailsController) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 140, vertical: 15).copyWith(bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstant.appWhite,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.appBlack.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: AppImageAsset(
        image: '${ImageConstant.baseUrl}${jobDetailsController.job!.company!.first.logo}',
        isWebImage: true,
        height: 40,
        width: 40,
      ),
    );
  }

  jobDetailsView({required String image, required String title, required String subTitle}) {
    return Column(
      children: [
        AppImageAsset(
          image: image,
          height: 35,
          width: 35,
        ),
        const SizedBox(height: 3),
        AppText(
          text: title,
          textAlign: TextAlign.center,
          fontSize: 11,
          fontColor: ColorConstant.appgrey,
        ),
        const SizedBox(height: 5),
        AppText(
          text: subTitle,
          textAlign: TextAlign.center,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontColor: ColorConstant.appBlack,
        ),
      ],
    );
  }

  descriptionDetailsView(JobDetailsController jobDetailsController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const AppText(
          text: 'About this job',
          fontSize: 16,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        AppText(
          fontColor: ColorConstant.appBlack,
          fontSize: 13,
          textAlign: TextAlign.start,
          maxLines: jobDetailsController.isReadMore ? 100 : 3,
          text:
              'Lorem Ipsum is simply dummy text of the printing and typeset ting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typeset ting industry. ' *
                  12,
        ),
        SizedBox(height: 5.px),
        GestureDetector(
          onTap: () => jobDetailsController.readMore(),
          child: AppText(
            text: !jobDetailsController.isReadMore ? 'Read more' : 'Show less',
            fontSize: 12,
            fontColor: ColorConstant.appBlue,
          ),
        ),
        const SizedBox(height: 15),
        const AppText(
          text: 'In the short term,you will',
          fontSize: 16,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        const AppText(
          text: '• Become familiar with our design systems,style & design process',
          textAlign: TextAlign.start,
          maxLines: 2,
          fontSize: 13,
        ),
        const SizedBox(height: 5),
        const AppText(
          text: '• Contribute to designs & design reviews',
          textAlign: TextAlign.start,
          maxLines: 2,
          fontSize: 13,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  mapView() {
    return const Center(
      child: AppText(text: 'Map'),
    );
  }

  companyView() {
    return const Center(
      child: AppText(text: 'Company'),
    );
  }

  reviewView() {
    return const Center(
      child: AppText(text: 'Review'),
    );
  }
}

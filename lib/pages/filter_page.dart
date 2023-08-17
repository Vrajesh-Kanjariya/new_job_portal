import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/color_constant.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:new_job_portal/controller/filter_controller.dart';
import 'package:new_job_portal/widgets/app_dropdown_buton.dart';
import 'package:new_job_portal/widgets/app_elevated_button.dart';
import 'package:new_job_portal/widgets/app_image_assets.dart';
import 'package:new_job_portal/widgets/app_text.dart';
import 'package:new_job_portal/widgets/app_text_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/app_loader.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (FilterController controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SizedBox(height: 16.px),
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppImageAsset(
                        image: ImageConstant.logo,
                        width: 100.px,
                      ),
                    ),
                    SizedBox(height: 16.px),
                    const AppText(
                      text:
                          'Find,\ncreate trackable resumes and enrich your applications,Carefully crafted '
                              'after analyzing the needs of diffrent industries.',
                      maxLines: 4,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    const SizedBox(height: 20),
                    AppTextFormField(
                      height: 50,
                      textAlign: TextAlign.start,
                      controller: controller.jobTypeController,
                      hint: 'Web developer',
                      fontSize: 15.px,
                      fillColor: ColorConstant.appWhite,
                      borderColor: ColorConstant.appgrey,
                      borderWidth: 2.px,
                      autoFocus: false,
                      hintFontSize: 14.px,
                      fontColor: ColorConstant.appBlack,
                      errorText: controller.jobTypeError,
                    ),
                    const SizedBox(height: 15),
                    AppDropdownButton(
                      hint: 'Select job type',
                      value: controller.selectedCategory == null ? null : controller.selectedCategory!.title,
                      dropdownHeight: Device.height / 3,
                      dropdownItems: controller.categoryList,
                      onChanged: (value) => controller.jobFiledChange(value),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.px),
                      child: AppText(text: controller.jobFiledError, fontColor: ColorConstant.offRed, fontSize: 12.px),
                    ),
                    const SizedBox(height: 15),
                    AppDropdownButton(
                      hint: 'Select country',
                      dropdownHeight: Device.height / 3,
                      value: controller.selectedCountry == null ? null : controller.selectedCountry!.name,
                      dropdownItems: controller.countryList,
                      onChanged: (value) => controller.selectCountry(value),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.px),
                      child: AppText(text: controller.countyError, fontColor: ColorConstant.offRed, fontSize: 12.px),
                    ),
                    const SizedBox(height: 15),
                    AppDropdownButton(
                      hint: 'Select state',
                      dropdownHeight: Device.height / 3,
                      value: controller.selectedState == null ? null : controller.selectedState!.name,
                      dropdownItems: controller.stateList,
                      onChanged: (value) => controller.selectState(value),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.px),
                      child: AppText(text: controller.stateError, fontColor: ColorConstant.offRed, fontSize: 12.px),
                    ),
                    const SizedBox(height: 15),
                    AppDropdownButton(
                      hint: 'Select city',
                      dropdownHeight: Device.height / 3,
                      value: controller.selectedCity == null ? null : controller.selectedCity!.name,
                      dropdownItems: controller.cityList,
                      onChanged: (value) => controller.selectCity(value),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.px),
                      child: AppText(text: controller.cityError, fontColor: ColorConstant.offRed, fontSize: 12.px),
                    ),
                  ],
                ),
                controller.isLoading ? const AppLoader() : const SizedBox(),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () =>  controller.applyFilter(),
            child: AppElevatedButton(
              text: 'Filter',
              margin: 15.px,
            ),
          ),
        );
      },
    );
  }
}

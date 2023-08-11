import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/color_constant.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/widgets/app_logs.dart';
import 'package:url_launcher/url_launcher.dart';

extension SnackBar on String {
  showError() {
    Get.snackbar(
      'Error!!',
      this,
      backgroundColor: ColorConstant.offRed,
      colorText: ColorConstant.appWhite,
    );
  }

  showSuccess() {
    Get.snackbar(
      'Success!!',
      this,
      backgroundColor: ColorConstant.lightBlue,
      colorText: ColorConstant.appWhite,
    );
  }

  copyCode() {
    Clipboard.setData(ClipboardData(text: this));
    '$this code copied'.showSuccess();
  }

  formatString() {
    if (length != 13) return;
    String value = '${substring(0, 3)} xxx${substring(length - 3, length)}';
    return value;
  }

  launchLink(BuildContext context, {LaunchMode? mode}) async {
    try {
      if (await canLaunchUrl(Uri.parse(this))) {
        await launchUrl(Uri.parse(this), mode: mode ?? LaunchMode.externalApplication);
      } else {
        Future.delayed(const Duration(microseconds: 1), () => 'Something went wrong.!'.showError());
      }
    } catch (e) {
      logs('Catch exception in onTapWhatsapp --> $e');
    }
  }
}

extension StringCasingExtension on String {
  String stringAsFixed({int? fixValue}) => padLeft(fixValue ?? 2, '0');
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/color_constant.dart';
import 'app_theme.dart';

void urlLauncher({@required String? url,LaunchMode mode = LaunchMode.inAppWebView}) async {
  logs('urlLauncher --> $url');
  Uri uri = Uri.parse(url!);
  await canLaunchUrl(uri)
      ? await launchUrl(uri, mode: mode)
      : throw 'Could not launch --> $uri';
}

void logs(String message) {
  if (kDebugMode) {
    print(message);
  }
}

showMessage(BuildContext context,
    {@required String? message,
    Color textColor = ColorConstant.themeScaffold,
    Color? backgroundColor,
    bool isError = false}) {

  logs("===> ${message.toString()}");

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:
          isError ? ColorConstant.red.withOpacity(0.6) : backgroundColor,
      content: Text(
        message!,
        style: TextStyle(
          fontFamily: AppTheme.defaultFont,
          color: textColor,
          fontWeight: FontWeight.w400,
          wordSpacing: 1,
          fontSize: 14,
        ),
      ),
    ),
  );
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

String dateFormatter(String? date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(DateTime.parse(date!));
  return formatted;
}

String dateFormatterString(DateTime? date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(date!);
  return formatted;
}

String birthDate(DateTime? date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(date!);
  return formatted;
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color_constant.dart';
import '../../widgets/app_text.dart';

class ErrorText extends StatelessWidget {
  final String errorText;
  final double fontSize;

  const ErrorText({Key? key, required this.errorText, this.fontSize = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.px),
      margin: EdgeInsets.only(top: 2.px),
      child: AppText(
        text: errorText,
        fontColor: ColorConstant.offRed,
        fontSize: fontSize.px,
        fontWeight: FontWeight.w400,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

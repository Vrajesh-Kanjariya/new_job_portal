import 'package:flutter/material.dart';
import 'package:new_job_portal/widgets/app_text.dart';

import '../constant/color_constant.dart';

class AppElevatedButton extends StatelessWidget {
  final double? height;
  final double width;
  final double margin;
  final double fontSize;
  final double borderRadius;
  final String? text;
  final Color fontColor;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const AppElevatedButton({
    Key? key,
    this.height,
    this.width = double.infinity,
    this.margin = 30,
    this.fontSize = 20,
    this.borderRadius = 50,
    this.text,
    this.fontColor = ColorConstant.white,
    this.onPressed,
    this.fontWeight,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            ColorConstant.blue.withOpacity(0.8),
            ColorConstant.buttonBlue,
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          shadowColor: MaterialStateProperty.all(ColorConstant.transparent),
        ),
        child: AppText(
          text: text,
          fontSize: fontSize,
          fontColor: fontColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

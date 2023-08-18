import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../constant/color_constant.dart';
import 'app_theme.dart';

class AppHtml extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color fontColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? wordSpacing;
  final double? letterSpacing;
  final TextDecoration? textDecoration;

  const AppHtml({
    Key? key,
    @required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontColor = ColorConstant.appBlack,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.wordSpacing,
    this.letterSpacing,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      text!,
      textStyle: TextStyle(
        overflow: overflow,
        fontFamily: AppTheme.defaultFont,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:new_job_portal/widgets/app_text.dart';

import '../constant/color_constant.dart';

class AppDropdownButton extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const AppDropdownButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: AppText(
            text: hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            fontSize: 16,
            fontColor: ColorConstant.hintColor,
          ),
        ),
        value: value,
        items: dropdownItems
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                  width: double.infinity,
                  alignment: valueAlignment,
                  child: AppText(
                    text: item,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    fontSize: 16,
                    fontColor: ColorConstant.appBlack,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: icon ?? const Icon(Icons.expand_more),
          ),
          iconSize: iconSize ?? 22,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 54,
          width: buttonWidth ?? 140,
          padding: buttonPadding ?? const EdgeInsets.fromLTRB(24, 15, 0, 18),
          decoration: buttonDecoration ??
              BoxDecoration(
                color: ColorConstant.appWhite,
                borderRadius: BorderRadius.circular(50),
              ),
          elevation: buttonElevation,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: dropdownHeight ?? 200,
          width: dropdownWidth ?? 300,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
          elevation: dropdownElevation ?? 8,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness: MaterialStatePropertyAll(scrollbarThickness),
            thumbVisibility: MaterialStatePropertyAll(scrollbarAlwaysShow),
          ),
          isOverButton: false,
        ),
        isDense: false,
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 52,
          padding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

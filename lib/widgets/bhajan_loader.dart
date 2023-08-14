import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_job_portal/constant/image_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color_constant.dart';

// class BhajanLoader extends StatelessWidget {
//   final Color loaderColor;
//   final double loaderSize;
//   final bool isSmallLoader;
//
//   const BhajanLoader(
//       {Key? key,
//       this.loaderColor = ColorConstant.white,
//       this.loaderSize = 130,
//       this.isSmallLoader = false})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return isSmallLoader
//         ? Lottie.asset(ImageConstant.loaderAnimation, height: loaderSize.px, width: loaderSize.px)
//         : Container(
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//             color: ColorConstant.transparent,
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
//               child: Lottie.asset(
//                 ImageConstant.loaderAnimation,
//                 height: loaderSize.px,
//                 width: loaderSize.px,
//               ),
//             ),
//           );
//   }
// }
//
// class BhajanJustLoader extends StatelessWidget {
//   final Color loaderColor;
//   final double loaderSize;
//
//   const BhajanJustLoader(
//       {Key? key, this.loaderColor = ColorConstant.primary, this.loaderSize = 40})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Lottie.asset(ImageConstant.loaderAnimation,
//             height: loaderSize.px, width: loaderSize.px));
//   }
// }

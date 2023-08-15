


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

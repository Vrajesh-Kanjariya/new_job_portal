import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/image_constant.dart';
import 'app_loader.dart';

class AppImageAsset extends StatelessWidget {
  final String? image;
  final bool isWebImage;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const AppImageAsset({
    Key? key,
    @required this.image,
    this.fit,
    this.height = 20,
    this.width = 20,
    this.color,
    this.isWebImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isWebImage
        ? CachedNetworkImage(
            imageUrl: image!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => const AppLoader(),
            errorWidget: (context, url, error) => const AppImageAsset(
              image: ImageConstant.userAvatar,
              fit: BoxFit.contain,
            ),
          )
        : image!.split('.').last != 'svg'
            ? Image.asset(
                image!,
                fit: fit,
                height: height,
                width: width,
                color: color,
              )
            : SvgPicture.asset(
                image!,
                height: height,
                width: width,
                color: color,
              );
  }
}

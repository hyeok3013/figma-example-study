// ignore: unused_import
import 'package:figma_study/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetSvgImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Color? color;

  const AssetSvgImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$image.svg',
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
      placeholderBuilder: (BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      ),
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }
}

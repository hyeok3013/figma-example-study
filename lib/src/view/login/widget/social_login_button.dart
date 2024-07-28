import 'package:figma_study/src/service/theme_service.dart';
import 'package:figma_study/theme/component/asset_svg_image.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.sns});
  final String sns;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 58,
        width: 271,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: context.color.surface,
            boxShadow: context.deco.shadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetSvgImage(image: sns),
            SizedBox(
              width: 20,
            ),
            Text(
              'Login with $sns',
              style: context.typo.subtitle1.copyWith(color: context.color.text),
            ),
          ],
        ),
      ),
    );
  }
}

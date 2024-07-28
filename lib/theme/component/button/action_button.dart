import 'package:figma_study/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 58,
        width: 271,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: context.color.primary),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text,
              style: context.typo.subtitle1.copyWith(
                  fontWeight: context.typo.semiBold,
                  color: context.color.onPrimary),
            ),
            Align(
              alignment: Alignment(0.85, 0),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: context.color.secondary,
                foregroundColor: context.color.onSecondary,
                child: Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:figma_study/theme/foundation/app_theme.dart';
import 'package:figma_study/theme/res/palette.dart';
import 'package:figma_study/theme/res/typo.dart';
import 'package:flutter/material.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    primary: Palette.blue100,
    onPrimary: Palette.black,
    secondary: Palette.blue300,
    onSecondary: Palette.black,
    hint: Palette.gray700,
    hintContainer: Palette.gray900,
    onHintContainer: Palette.gray500,
    text: Palette.white,
    surface: Palette.black,
    // background: Palette.someColor,
    // subtext: Palette.someColor,
    // toastContainer: Palette.someColor,
    // onToastContainer: Palette.someColor,
    // inactive: Palette.someColor,
    // inactiveContainer: Palette.someColor,
    // onInactiveContainer: Palette.someColor,
    // tertiary: Palette.someColor,
    // onTertiary: Palette.someColor,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const AirbnbCereal(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.35),
        blurRadius: 35,
      ),
    ],
  );
}

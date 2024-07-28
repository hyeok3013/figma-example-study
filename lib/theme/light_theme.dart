import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    surface: Palette.white,
    // background: Palette.black.withOpacity(0.55),
    text: Palette.black,
    // subtext: Palette.gray700, // subtext는 제공되지 않았으므로 gray700 사용
    // toastContainer: Palette.black.withOpacity(0.85),
    // onToastContainer: Palette.gray100, // onToastContainer는 제공되지 않았으므로 gray100 사용
    hint: Palette.gray300,
    hintContainer: Palette.gray100,
    onHintContainer: Palette.gray500,
    // inactive: Palette.gray400, // inactive는 제공되지 않았으므로 gray400 사용
    // inactiveContainer: Palette.gray200, // inactiveContainer는 제공되지 않았으므로 gray200 사용
    // onInactiveContainer: Palette.white,
    primary: Palette.blue500,
    onPrimary: Palette.white,
    secondary: Palette.blue700,
    onSecondary: Palette.white,
    // tertiary: Palette.gray300, // tertiary는 제공되지 않았으므로 gray300 사용
    // onTertiary: Palette.white, // onTertiary는 제공되지 않았으므로 white 사용
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
        color: Palette.black.withOpacity(0.1),
        blurRadius: 35,
      ),
    ],
  );
}

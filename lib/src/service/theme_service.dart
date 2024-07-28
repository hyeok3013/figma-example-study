import 'package:figma_study/theme/dark_theme.dart';
import 'package:figma_study/theme/foundation/app_theme.dart';
import 'package:figma_study/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? theme,
  }) : theme = theme ?? LightTheme();

  /// 현재 테마
  AppTheme theme;

  /// 테마 변경
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }
}

extension ThemeExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  AppColor get color => theme.color;
  AppTypo get typo => theme.typo;
  AppDeco get deco => theme.deco;
}

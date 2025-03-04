part of 'app_theme.dart';

class AppColor {
  const AppColor({
    required this.surface,
    required this.text,
    required this.hint,
    required this.hintContainer,
    required this.onHintContainer,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
  });

  /// Surface
  final Color surface;

  /// Text
  final Color text;

  /// Hint
  ///
  final Color hint;
  final Color hintContainer;
  final Color onHintContainer;

  /// Accent
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
}

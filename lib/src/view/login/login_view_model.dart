import 'package:figma_study/src/service/auth_service.dart';
import 'package:figma_study/src/view/base_view_model.dart';
import 'package:figma_study/src/view/verification/verification_view_test.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService;
  bool isAuto = false;

  LoginViewModel({required this.authService}) {
    authService.addListener(notifyListeners);
  }

  @override
  void dispose() {
    authService.removeListener(notifyListeners);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///Auto Login
  void toggleRememberMe(bool value) {
    isAuto = value;
    notifyListeners();
  }

  void onSuccess(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationViewTest(), // 다음 페이지로 변경하세요.
      ),
    );
  }

  void signInPressed(BuildContext context) {
    authService.signIn(
      email: emailController.text,
      password: passwordController.text,
      onSuccess: () => onSuccess(context),
      onError: (onError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(onError),
          ),
        );
      },
    );
  }
}

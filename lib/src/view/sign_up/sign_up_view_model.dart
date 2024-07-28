import 'package:figma_study/src/service/auth_service.dart';
import 'package:figma_study/src/view/base_view_model.dart';
import 'package:figma_study/src/view/login/login_view.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final AuthService authService;

  SignUpViewModel({required this.authService}) {
    authService.addListener(notifyListeners);
  }

  void onSuccess(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(), // 다음 페이지로 변경하세요.
      ),
    );
  }

  void signUpOnPressed(BuildContext context) {
    if (passwordController.text == confirmController.text) {
      authService.signUp(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: () {
          onSuccess(context);
        },
        onError: (onError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(onError),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('동일한 비밀번호를 입력해주세요.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    authService.removeListener(notifyListeners);
    super.dispose();
  }
}

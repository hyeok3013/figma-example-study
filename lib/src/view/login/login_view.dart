import 'package:figma_study/src/service/theme_service.dart';
import 'package:figma_study/src/view/base_view.dart';
import 'package:figma_study/src/view/login/login_view_model.dart';
import 'package:figma_study/src/view/reset_password/reset_password_view_test.dart';
import 'package:figma_study/src/view/sign_up/sign_up_view.dart';
import 'package:figma_study/theme/component/asset_svg_image.dart';
import 'package:figma_study/theme/component/button/action_button.dart';
import 'package:figma_study/src/view/login/widget/social_login_button.dart';
import 'package:figma_study/theme/component/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(authService: context.read()),
      builder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///Logo
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        ///LogoImage
                        const AssetSvgImage(
                          image: 'logo',
                          width: 55.5,
                          height: 58,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        ///LogoText
                        Text(
                          'EventHub',
                          style: context.typo.headline1
                              .copyWith(fontWeight: context.typo.semiBold),
                        ),
                      ],
                    ),
                  ),

                  ///Sign in 이 부분도 컴포넌트로 해야하나?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        ///Text
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sign in',
                            style: context.typo.headline2
                                .copyWith(fontWeight: context.typo.semiBold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///Email Input
                        InputField(
                            textEditingController: viewModel.emailController,
                            prefixIcon: Icons.mail_outline_rounded,
                            hintText: 'abc@email.com',
                            isPassword: false),

                        const SizedBox(
                          height: 20,
                        ),

                        ///Password Input
                        InputField(
                            textEditingController: viewModel.passwordController,
                            prefixIcon: Icons.lock_outline_rounded,
                            hintText: 'your password',
                            isPassword: true),

                        const SizedBox(
                          height: 15,
                        ),

                        ///자동로그인
                        Row(
                          children: [
                            Transform.scale(
                              origin: const Offset(-20, 0),
                              scale: 0.8,
                              child: Switch(
                                value: viewModel.isAuto,
                                activeTrackColor: context.color.primary,
                                onChanged: (value) =>
                                    viewModel.toggleRememberMe(value),
                              ),
                            ),
                            Text(
                              'Remember Me',
                              style: context.typo.body1,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPasswordViewTest(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: context.typo.body1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        ///Sign In Button
                        ActionButton(
                          text: 'SIGN IN',
                          onPressed: () {
                            viewModel.signInPressed(context);
                          },
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        ///OR
                        Text(
                          'OR',
                          style: context.typo.subtitle1.copyWith(
                              fontWeight: context.typo.semiBold,
                              color: context.color.onHintContainer),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        ///Social Login Button
                        const SocialLoginButton(
                          sns: 'Google',
                        ),
                        const SizedBox(
                          height: 17,
                        ),

                        const SocialLoginButton(
                          sns: 'Facebook',
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?  ',
                              style: context.typo.subtitle2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpView(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign up',
                                style: context.typo.subtitle2
                                    .copyWith(color: context.color.primary),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

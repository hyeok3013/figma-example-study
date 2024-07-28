import 'package:figma_study/src/service/theme_service.dart';
import 'package:figma_study/src/view/base_view.dart';
import 'package:figma_study/src/view/sign_up/sign_up_view_model.dart';
import 'package:figma_study/theme/component/button/action_button.dart';
import 'package:figma_study/src/view/login/widget/social_login_button.dart';
import 'package:figma_study/theme/component/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      viewModel: SignUpViewModel(authService: context.read()),
      builder: (BuildContext context, SignUpViewModel viewModel) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign up',
                      style: context.typo.headline2
                          .copyWith(fontWeight: context.typo.semiBold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///LoginId
                  InputField(
                      prefixIcon: Icons.person_outline_rounded,
                      hintText: 'Full name',
                      isPassword: false,
                      textEditingController: viewModel.nameController),
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
                    height: 20,
                  ),

                  InputField(
                    prefixIcon: Icons.lock_outline_rounded,
                    hintText: 'Confirm password',
                    isPassword: true,
                    textEditingController: viewModel.confirmController,
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  ActionButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      viewModel.signUpOnPressed(context);
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
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign in',
                          style: context.typo.subtitle2
                              .copyWith(color: context.color.primary),
                        ),
                      )
                    ],
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

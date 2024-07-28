import 'package:figma_study/src/service/theme_service.dart';
import 'package:figma_study/theme/component/button/action_button.dart';
import 'package:figma_study/theme/component/input_field.dart';
import 'package:flutter/material.dart';

///이건 뷰만 보여주기로
class ResetPasswordViewTest extends StatelessWidget {
  const ResetPasswordViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Reset Password',
                  style: context.typo.headline2
                      .copyWith(fontWeight: context.typo.semiBold),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please enter your email address to request a password reset',
                  style: context.typo.subtitle2,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              ///LoginId

              InputField(
                prefixIcon: Icons.mail_outline_rounded,
                hintText: 'abc@email.com',
                isPassword: false,
                textEditingController: textEditingController,
              ),

              const SizedBox(
                height: 40,
              ),

              ActionButton(
                text: 'SEND',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:figma_study/src/service/theme_service.dart';
import 'package:figma_study/theme/component/button/action_button.dart';
import 'package:flutter/material.dart';

///이건 우선 뷰만 보여주기로
class VerificationViewTest extends StatefulWidget {
  const VerificationViewTest({super.key});

  @override
  State<VerificationViewTest> createState() => _VerificationViewTestState();
}

class _VerificationViewTestState extends State<VerificationViewTest> {
  late Timer _timer;
  int _start = 20;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
          print(_start);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  'Verification',
                  style: context.typo.headline2
                      .copyWith(fontWeight: context.typo.semiBold),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'We’ve sent you the verification code on +1 2620 0323 7631',
                  style: context.typo.subtitle2,
                ),
              ),
              const SizedBox(height: 30),
              _buildPinFields(context),
              const SizedBox(height: 40),
              ActionButton(
                text: 'CONTINUE',
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Re-send code in  ',
                    style: context.typo.subtitle2,
                  ),
                  Container(
                    width: 42, // 고정된 너비
                    child: Text(
                      '$_start:00',
                      textAlign: TextAlign.center,
                      style: context.typo.subtitle2
                          .copyWith(color: context.color.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinFields(BuildContext context) {
    final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

    return Wrap(
      spacing: 30,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 55,
          height: 55,
          child: TextField(
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: context.typo.headline2
                .copyWith(fontWeight: context.typo.semiBold),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(3, 12, 0, 9),
              counterText: "",
              hintStyle: context.typo.headline3.copyWith(
                fontWeight: context.typo.semiBold,
                color: context.color.hint,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.color.hint,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1.5,
                  color: context.color.primary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.color.hint,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}

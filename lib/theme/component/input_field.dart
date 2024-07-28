import 'package:figma_study/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final IconData prefixIcon;
  final String hintText;
  final bool isPassword;

  const InputField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.isPassword,
    required this.textEditingController,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscurePassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: context.color.onHintContainer,
        ),

        /// 힌트 스타일
        hintStyle: context.typo.body1.copyWith(
          fontWeight: context.typo.regular,
          color: context.color.onHintContainer,
        ),
        hintText: widget.hintText,

        contentPadding: const EdgeInsets.only(left: 50, top: 20, bottom: 20),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: widget.isPassword
              ? IconButton(
                  color: context.color.onHintContainer,
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: _obscurePassword
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                )
              : null,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

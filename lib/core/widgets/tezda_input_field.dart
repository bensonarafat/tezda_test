import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TezdaInputField extends StatefulWidget {
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffixIconAlt;
  final TextStyle? labelStyle;
  final bool obscureText;
  final Function(String? value) onChange;
  final String? errorText;
  final Widget? helper;
  final String? hint;
  final Widget? info;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const TezdaInputField({
    super.key,
    required this.label,
    required this.onChange,
    this.errorText,
    this.prefixIcon,
    this.labelStyle,
    this.suffixIcon,
    this.obscureText = false,
    this.suffixIconAlt,
    this.helper,
    this.hint,
    this.info,
    this.keyboardType,
    this.controller,
  });

  @override
  State<TezdaInputField> createState() => _TezdaInputFieldState();
}

class _TezdaInputFieldState extends State<TezdaInputField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: widget.labelStyle,
            ),
            widget.info ?? const SizedBox.shrink()
          ],
        ),
        const Gap(5),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChange,
          obscureText: obscureText,
          cursorColor: Colors.black,
          cursorErrorColor: Colors.red,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            errorMaxLines: 3,
            helper: widget.helper,
            contentPadding: const EdgeInsets.all(16),
            filled: true,
            fillColor: const Color(0xffE3EDF2),
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon == null
                ? null
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child:
                        obscureText ? widget.suffixIcon : widget.suffixIconAlt,
                  ),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

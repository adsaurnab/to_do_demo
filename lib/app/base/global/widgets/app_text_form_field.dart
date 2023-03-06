import 'package:flutter/material.dart';
import 'package:todo_app/app/base/global/constants/app_colors.dart';
import 'package:todo_app/app/base/global/constants/constants.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    this.hintText = "",
    this.controller,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.readOnly = false,
    this.isPassword = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final bool readOnly, isPassword;
  final int? minLines, maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.isPassword ? p(
        left: 20.0,
        right: 0.0,
      ): pSymH20,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.purpleColor),
          
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child:
                      Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                )
              : null,
        ),
        obscureText: widget.isPassword ? isVisible ? false : true : false,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        onTap: widget.readOnly ? (widget.onTap) : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

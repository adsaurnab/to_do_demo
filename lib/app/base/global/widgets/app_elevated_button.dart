import 'package:flutter/material.dart';
import 'package:todo_app/app/base/global/constants/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    this.text = "",
    this.fontSize = 16,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.onPressed,
    Key? key,
  }) :  super(key: key);

  final String? text;
  final double? fontSize;
  final Color? backgroundColor,textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        ),
        onPressed: onPressed,              
        child:  Text("$text",
          style:  TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
        
      );
  }
}
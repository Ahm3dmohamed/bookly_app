import 'package:flutter/material.dart';
import '../../config/size_config.dart';
import '../style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onPressed;

  const CustomButton({
    required this.text,
    required this.color,
    required this.borderRadius,
    required this.margin,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.height(1.4),
            horizontal: SizeConfig.width(2),
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: Colors.black,
            fontFamily: "bookfont",
          ),
        ),
      ),
    );
  }
}

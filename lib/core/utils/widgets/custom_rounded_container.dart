import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../style.dart';

// ignore: must_be_immutable
class CustomRounderContainer extends StatelessWidget {
  final Function onTap;
  String txt;
  Color color;
  BorderRadius borderRadius;
  EdgeInsetsGeometry edgeInsetsGeometry;
  CustomRounderContainer({
    required this.borderRadius,
    required this.txt,
    required this.edgeInsetsGeometry,
    required this.color,
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.width(3)),
      margin: edgeInsetsGeometry,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Text(txt,
          style: Styles.textStyle24.copyWith(
            color: Colors.black,
            fontFamily: "bookfont",
          )),
    );
  }
}

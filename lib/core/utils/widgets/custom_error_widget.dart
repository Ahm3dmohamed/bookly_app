import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  String errMessage;

  CustomErrorWidget({required this.errMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage, style: Styles.textStyle18));
  }
}

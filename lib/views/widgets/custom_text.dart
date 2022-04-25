import 'package:flutter/material.dart';
import 'package:monitoring_ui/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomText({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: color ?? kWhiteColor70,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

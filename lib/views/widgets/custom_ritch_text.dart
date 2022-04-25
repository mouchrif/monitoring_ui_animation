import 'package:flutter/material.dart';
import 'package:monitoring_ui/constants.dart';

class CustomRitchText extends StatelessWidget {
  final String text;
  final String subText;
  const CustomRitchText({Key? key, required this.text, required this.subText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$text\n",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: kWhiteColor70,
                  fontSize: getSize16(context),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.01,
                ),
          ),
          TextSpan(
            text: subText,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

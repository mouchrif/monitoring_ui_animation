import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitoring_ui/constants.dart';
import 'package:monitoring_ui/views/widgets/custom_ritch_text.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CustomCard extends StatelessWidget {
  final IconData iconData;
  final String value;
  final String title;
  final String subTitle;
  final Color sparkLineColor;
  final List<num>? data;
  final VoidCallback onTap;
  const CustomCard(
      {Key? key,
      required this.iconData,
      required this.value,
      required this.title,
      required this.subTitle,
      required this.sparkLineColor,
      required this.data, 
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double elevation = 6.0;
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(getRadius10(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.white70.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: elevation,
            offset: const Offset(-2.0, -2.0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 4.0,
            blurRadius: elevation,
            offset: const Offset(4.0, 4.0),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: constraints.maxHeight * 0.06,
                right: constraints.maxWidth * 0.03,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    FontAwesomeIcons.chevronDown,
                    color: kWhiteColor70,
                    size: getSize20(context),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: constraints.maxHeight/2,
              child:  Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.4 -
                        2 * constraints.maxWidth * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          iconData,
                          color: kTextColor,
                          size: getSize24(context) * 1.1,
                        ),
                        Text(
                          value,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.02,
                      top: constraints.maxHeight * 0.06,
                    ),
                    width: (constraints.maxWidth -
                            constraints.maxWidth * 0.04 * 2) -
                        (constraints.maxWidth * 0.4 -
                            2 * constraints.maxWidth * 0.04),
                    child: CustomRitchText(text: title, subText: subTitle),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: constraints.maxHeight/2,
              child: Container(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.06,
                  left: constraints.maxWidth * 0.04,
                  right: constraints.maxWidth * 0.04,
                  bottom: constraints.maxHeight * 0.08,
                ),
                height: constraints.maxHeight * 0.5,
                width: getWidthScreen(context),
                child: SfSparkLineChart(
                  color: sparkLineColor,
                  data: data,
                  axisLineColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
SizedBox(
              height: constraints.maxHeight / 2,
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.4 -
                        2 * constraints.maxWidth * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          iconData,
                          color: kTextColor,
                          size: getSize24(context) * 1.1,
                        ),
                        Text(
                          value,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.02,
                      top: constraints.maxHeight * 0.06,
                    ),
                    width: (constraints.maxWidth -
                            constraints.maxWidth * 0.04 * 2) -
                        (constraints.maxWidth * 0.4 -
                            2 * constraints.maxWidth * 0.04),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$title\n",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: kWhiteColor70,
                                      fontSize: getSize16(context),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.01,
                                    ),
                          ),
                          TextSpan(
                            text: subTitle,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.06,
                  left: constraints.maxWidth * 0.04,
                  right: constraints.maxWidth * 0.04,
                  bottom: constraints.maxHeight * 0.08,
                ),
                height: constraints.maxHeight * 0.5,
                width: getWidthScreen(context),
                child: SfSparkLineChart(
                  color: sparkLineColor,
                  data: data,
                  axisLineColor: Colors.transparent,
                ),
              ),
            ),
*/
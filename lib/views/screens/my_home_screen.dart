import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitoring_ui/constants.dart';
import 'package:monitoring_ui/models/heart_rate_model.dart';
import 'package:monitoring_ui/views/widgets/custom_card.dart';
import 'package:monitoring_ui/views/widgets/custom_ritch_text.dart';
import 'package:monitoring_ui/views/widgets/custom_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/details-screen";

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final GlobalKey sweatKey = GlobalKey();
  final GlobalKey tempKey = GlobalKey();
  double opacity = 0.0;
  bool flag = false;
  bool isLoadingWidget = false;
  final List<HeartRateModel> _beatsRateData = [];
  List<HeartRateModel> getBeatsRateData() => _beatsRateData;
  void addBeatsRate() {
    _beatsRateData.add(HeartRateModel(bpm: 80, time: 0));
    _beatsRateData.add(HeartRateModel(bpm: 125, time: 15));
    _beatsRateData.add(HeartRateModel(bpm: 100, time: 30));
    _beatsRateData.add(HeartRateModel(bpm: 35, time: 45));
    _beatsRateData.add(HeartRateModel(bpm: 45, time: 60));
  }

  void loadingWidget() {
    Timer(const Duration(milliseconds: 250), () {
      setState(() {
        isLoadingWidget = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    addBeatsRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Today", color: kTextColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCrossFade(
            firstCurve: Curves.easeIn,
            secondCurve: Curves.easeIn,
            firstChild: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getDefaultPadding(context),
                  vertical: getDefaultPadding(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Your Stats"),
                  SizedBox(height: getHeightScreen(context) * 0.018),
                  SizedBox(
                    height: getHeightScreen(context) * 0.14,
                    width: getWidthScreen(context),
                    child: CustomCard(
                      iconData: FontAwesomeIcons.solidHeart,
                      value: "85",
                      title: "Heart Rate",
                      subTitle: "bpm",
                      sparkLineColor: Theme.of(context).primaryColor,
                      data: const [10, 8, 12, 8, 14, 14, 12, 11],
                      onTap: () {
                        setState(() {
                          flag = true;
                          isLoadingWidget = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            secondChild: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getDefaultPadding(context),
              ),
              height: getHeightScreen(context) -
                  3 * getHeightScreen(context) * 0.14 -
                  2 * getHeightScreen(context) * 0.025,
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomRitchText(
                            text: "Heart Rate", subText: "bpm"),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = false;
                            });
                            loadingWidget();
                          },
                          child: Icon(
                            FontAwesomeIcons.chevronUp,
                            color: kWhiteColor70,
                            size: getSize18(context),
                          ),
                        ),
                      ],
                    ),
                    Neumorphic(
                      style: const NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.circle(),
                          color: Color.fromARGB(255, 26, 29, 34),
                          depth: -6.0,
                          shadowDarkColorEmboss: kCardColorDark),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.5,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CircularPercentIndicator(
                                radius: constraints.maxHeight*0.16,
                                percent: 0.45,
                                startAngle: 22.5,
                                lineWidth: 14.0,
                                progressColor: kPrimaryColor,
                                animation: true,
                                animationDuration: 250,
                                curve: Curves.fastOutSlowIn,
                                circularStrokeCap: CircularStrokeCap.round,
                                reverse: false,
                                center: Text(
                                  "85",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                arcType: ArcType.FULL,
                                arcBackgroundColor: Colors.grey.shade400,
                              ),
                            ),
                            Positioned(
                              bottom: constraints.maxHeight*0.1,
                              left: 0,
                              right: 0,
                              child: Icon(
                                FontAwesomeIcons.solidHeart,
                                color: kWhiteColor70,
                                size: getSize24(context)*1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const CustomRitchText(
                        text: "Last Hour", subText: "bpm"),
                    Expanded(
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          LineSeries<HeartRateModel, double>(
                            color: kPrimaryColor,
                            sortingOrder: SortingOrder.none,
                            dataSource: getBeatsRateData(),
                            xValueMapper: (HeartRateModel rate, _) =>
                                rate.time,
                            yValueMapper: (HeartRateModel rate, _) =>
                                rate.bpm,
                            // dataLabelSettings: const DataLabelSettings(
                            //   isVisible: true,
                            //   color: kWhiteColor70,
                            // ),
                          ),
                        ],
                        primaryXAxis: NumericAxis(
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          labelFormat: '{value}m',
                        ),
                      ),
                    ),
                    const CustomText(text: "Other Stats"),
                    SizedBox(height: getHeightScreen(context)*0.012),
                  ],
                ),
              ),
            ),
            crossFadeState:
                flag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
            reverseDuration: const Duration(milliseconds: 250),
            sizeCurve: Curves.easeInOut,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getDefaultPadding(context),
            ),
            child: SizedBox(
              height: getHeightScreen(context) * 0.14,
              width: getWidthScreen(context),
              child: CustomCard(
                key: sweatKey,
                iconData: FontAwesomeIcons.droplet,
                value: "125",
                title: "Sweat Rate",
                subTitle: "ml/h",
                sparkLineColor: sweatColorChart,
                data: const [10, 8, 12, 8, 14, 14, 12, 11],
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: getHeightScreen(context) * 0.025),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getDefaultPadding(context),
            ),
            child: SizedBox(
              height: getHeightScreen(context) * 0.14,
              width: getWidthScreen(context),
              child: CustomCard(
                key: tempKey,
                iconData: FontAwesomeIcons.temperatureThreeQuarters,
                value: "99",
                title: "Temperature",
                subTitle: "°F",
                sparkLineColor: temperatureColorChart,
                data: const [10, 8, 12, 8, 14, 14, 12, 11],
                onTap: () {},
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 125),
            // reverseDuration: const Duration(milliseconds: 500),
            child: flag
                ? const SizedBox()
                : isLoadingWidget
                    ? const SizedBox()
                    : SizedBox(height: getHeightScreen(context) * 0.025 * 1.4),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 125),
            // reverseDuration: const Duration(milliseconds: 500),
            child: flag
                ? const SizedBox()
                : isLoadingWidget
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getDefaultPadding(context) * 2,
                        ),
                        child: Text(
                          "Start Expanding Cards To See More Details",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

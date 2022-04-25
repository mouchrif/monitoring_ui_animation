import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitoring_ui/constants.dart';
import 'package:monitoring_ui/helpers/app_colors_theme.dart';
import 'package:monitoring_ui/models/heart_rate_model.dart';
import 'package:monitoring_ui/views/screens/my_home_screen.dart';
import 'package:monitoring_ui/views/widgets/custom_card.dart';
import 'package:monitoring_ui/views/widgets/custom_ritch_text.dart';
import 'package:monitoring_ui/views/widgets/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  final GlobalKey sweatKey = GlobalKey();
  final GlobalKey tempKey = GlobalKey();
  double opacity = 0.0;
  bool flag = false;
  final List<HeartRateModel> _beatsRateData = [];
  List<HeartRateModel> getBeatsRateData() => _beatsRateData;
  void addBeatsRate() {
    _beatsRateData.add(HeartRateModel(bpm: 80, time: 0));
    _beatsRateData.add(HeartRateModel(bpm: 125, time: 15));
    _beatsRateData.add(HeartRateModel(bpm: 100, time: 30));
    _beatsRateData.add(HeartRateModel(bpm: 35, time: 45));
    _beatsRateData.add(HeartRateModel(bpm: 45, time: 60));
  }

  @override
  void initState() {
    super.initState();
    addBeatsRate();
  }

  @override
  Widget build(BuildContext context) {
    final double heightCard = getHeightScreen(context) * 0.2 -
        getHeightScreen(context) * 0.025 -
        getHeightScreen(context) * 0.032;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Today", color: kTextColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: getDefaultPadding(context),
            right: getDefaultPadding(context),
            // height: getHeightScreen(context)*0.2,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: flag
                  ? SizedBox(
                      height: getHeightScreen(context) * 0.52,
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
                              child: Container(
                                height: constraints.maxHeight * 0.5,
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
                          ],
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: "Your Stats"),
                        SizedBox(height: getHeightScreen(context) * 0.025),
                        SizedBox(
                          height: getHeightScreen(context) * 0.14,
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
                              });
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.fastOutSlowIn,
            top: flag
                // ? (getHeightScreen(context)*0.2 + getDefaultPadding(context))+getHeightScreen(context)*0.2
                ? getHeightScreen(context) -
                    3 * heightCard -
                    getDefaultPadding(context)
                : getHeightScreen(context) * 0.2 + getDefaultPadding(context),
            left: getDefaultPadding(context),
            right: getDefaultPadding(context),
            height: heightCard,
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
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.fastOutSlowIn,
            top: flag
                ? getHeightScreen(context) - 2 * heightCard
                : heightCard * 2 +
                    heightCard -
                    getDefaultPadding(context) * 2 +
                    getDefaultPadding(context) / 2,
            left: getDefaultPadding(context),
            right: getDefaultPadding(context),
            height: heightCard,
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
          AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: flag
                  ? getHeightScreen(context)
                  : (heightCard * 2 +
                          heightCard -
                          getDefaultPadding(context) * 2 +
                          getDefaultPadding(context) / 2) +
                      heightCard +
                      getDefaultPadding(context) * 2,
              left: getDefaultPadding(context) * 3.5,
              right: getDefaultPadding(context) * 3.5,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1250),
                opacity: flag ? 0.0 : 1.0,
                child: Text(
                  "Start Expanding Cards To See More Details",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
        ],
      ),
    );
  }
}

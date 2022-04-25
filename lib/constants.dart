import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff00ffff);
const Color kPrimaryLightColor = Color(0xff30F0F8);
const Color kCardColorDark = Color(0xff07080A);
const Color kTextColor = Color(0xff707A85);
const Color kBackgrounColor = Color(0xff2C3239);
const Color kCardColor = Color.fromARGB(255, 26, 29, 34);
const Color temperatureColorChart = Color(0xff433130);
const Color sweatColorChart = Color(0xffF51522);
const kWhiteColor70 = Colors.white70;

double getHeightScreen(BuildContext context) =>
    MediaQuery.of(context).size.height;
double getWidthScreen(BuildContext context) =>
    MediaQuery.of(context).size.width;
double getStatusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;

double getRadius10(BuildContext context) => getHeightScreen(context) / 80.29;
double getRadius08(BuildContext context) => getHeightScreen(context) / 100.3625;
double getRadius06(BuildContext context) => getHeightScreen(context) / 133.82;

double getSize24(BuildContext context) => getHeightScreen(context) / 33.45;
double getSize20(BuildContext context) => getHeightScreen(context) / 40.145;
double getSize18(BuildContext context) => getHeightScreen(context) / 44.60;
double getSize16(BuildContext context) => getHeightScreen(context) / 50.18;

double getDefaultPadding(BuildContext context) => getSize20(context);

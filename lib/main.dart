import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitoring_ui/constants.dart';
import 'package:monitoring_ui/helpers/app_colors_theme.dart';
import 'package:monitoring_ui/views/screens/my_home_screen.dart';
import 'package:monitoring_ui/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monitoring ui design',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        primarySwatch: AppColors.getMaterialColorFromColor(kPrimaryColor),
        scaffoldBackgroundColor: kBackgrounColor,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: kTextColor,
          ),
          headline6: TextStyle(
            color: kTextColor,
          ),
          headline4: TextStyle(
            color: kWhiteColor70,
          ),
        ),
      ),
      // home: const MyHomeScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomeScreen(),
        // DetailsScreen.routeName: (context) => const DetailsScreen(),
      },
    );
  }
}



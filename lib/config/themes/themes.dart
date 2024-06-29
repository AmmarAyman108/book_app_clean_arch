import 'package:book_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static getTheme() {
    return ThemeData.dark().copyWith(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(Colors.white),
              iconSize: WidgetStatePropertyAll(30))),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.primaryColor,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: AppColor.primaryColor,
              systemNavigationBarDividerColor: AppColor.primaryColor),
          backgroundColor: AppColor.primaryColor,
          elevation: 0),
      // textTheme: GoogleFonts.agbalumoTextTheme(
      //   ThemeData.dark().textTheme,
      // ),
      scaffoldBackgroundColor: AppColor.primaryColor,
    );
  }
}

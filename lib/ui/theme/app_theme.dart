import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 0, 176, 168);
  static const Color primaryExtendedColor = Color.fromARGB(255, 37, 150, 255);

  static Color primaryColor5 = primaryColor.withValues(alpha: 0.8);
  static Color primaryColor4 = primaryColor.withValues(alpha: 0.6);
  static Color primaryColor3 = primaryColor.withValues(alpha: 0.4);
  static Color primaryColor2 = primaryColor.withValues(alpha: 0.2);
  static Color primaryColor1 = primaryColor.withValues(alpha: 0.1);

  static const Color successColor = Color(0xff28c76f);
  static const Color infoColor = Color(0xff00cfe8);
  static const Color secondaryColor = Color(0xff82868b);
  static const Color warningColor = Color(0xffff9f43);
  static const Color dangerColor = Color(0xffea5455);
  static const Color lightColor = Color(0xfff6f6f6);
  static const Color darkColor = Color(0xff4b4b4b);

  static const Color blackTextColor = Colors.white70;

  static const Color backgroundColorGeneralDark =
      Color.fromARGB(255, 35, 36, 39);

  static const Color inputBackgroundColorDark = Color.fromARGB(255, 40, 46, 63);

  static final ThemeData dark = ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(primary: primaryExtendedColor),
      canvasColor: Colors.transparent,
      shadowColor: Colors.transparent,
      scaffoldBackgroundColor: backgroundColorGeneralDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        toolbarTextStyle: TextStyle(
            color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
        titleTextStyle: TextStyle(
            color: primaryColor, fontWeight: FontWeight.bold, fontSize: 21),
        centerTitle: true,
      ),
      drawerTheme:
          const DrawerThemeData(backgroundColor: backgroundColorGeneralDark),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: blackTextColor, fontSize: 60, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: blackTextColor, fontSize: 50, fontWeight: FontWeight.w900),
        displaySmall: TextStyle(
            color: blackTextColor, fontSize: 40, fontWeight: FontWeight.w800),
        headlineMedium: TextStyle(
            color: blackTextColor, fontSize: 30, fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            color: blackTextColor, fontSize: 20, fontWeight: FontWeight.w500),
        titleLarge: TextStyle(
            color: blackTextColor, fontSize: 10, fontWeight: FontWeight.w400),
        titleMedium: TextStyle(color: blackTextColor),
        titleSmall: TextStyle(color: blackTextColor),
        bodyLarge: TextStyle(color: blackTextColor),
        bodyMedium: TextStyle(color: blackTextColor),
        bodySmall: TextStyle(color: blackTextColor),
        labelLarge: TextStyle(color: blackTextColor),
        labelMedium: TextStyle(color: blackTextColor),
        labelSmall: TextStyle(color: blackTextColor),
      ).apply(
          displayColor: blackTextColor,
          bodyColor: blackTextColor,
          decorationColor: blackTextColor),
      inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          fillColor: Color.fromARGB(255, 40, 46, 63),
          filled: true,
          hoverColor: primaryColor,
          iconColor: Colors.white,
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          hintStyle: TextStyle(fontSize: 15, color: blackTextColor),
          counterStyle: TextStyle(color: blackTextColor),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppTheme.dangerColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          floatingLabelStyle: TextStyle(fontSize: 15, color: blackTextColor),
          labelStyle: TextStyle(fontSize: 15, color: blackTextColor),
          focusColor: primaryColor),
      checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateColor.resolveWith((states) => primaryColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
          linearMinHeight: 40,
          linearTrackColor: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          selectedIconTheme: IconThemeData(size: 30, shadows: [
            Shadow(blurRadius: 10, color: primaryColor.withValues(alpha: 0.8))
          ])),
      cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          surfaceTintColor: Colors.white,
          elevation: 0.2,
          color: Color.fromARGB(255, 78, 86, 105),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        extendedTextStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        backgroundColor: primaryColor,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStateProperty.resolveWith((states) => Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor:
            WidgetStateProperty.resolveWith((states) => primaryColor),
        padding: WidgetStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        shape:
            WidgetStateProperty.resolveWith((states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
      )),
      switchTheme:
          SwitchThemeData(materialTapTargetSize: MaterialTapTargetSize.padded),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(Colors.white),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              padding: WidgetStateProperty.resolveWith((states) =>
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              shape: WidgetStateProperty.resolveWith((states) =>
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              side: WidgetStateProperty.resolveWith((states) =>
                  const BorderSide(color: primaryColor, width: 2)))),
      dialogTheme: const DialogTheme(
        backgroundColor: AppTheme.backgroundColorGeneralDark,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      datePickerTheme: const DatePickerThemeData(
          confirmButtonStyle:
              ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor)),
          cancelButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(dangerColor))),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: backgroundColorGeneralDark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        labelStyle: TextStyle(fontSize: 20),
      ),
      dividerTheme: const DividerThemeData(color: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: Colors.white, textColor: blackTextColor));
}

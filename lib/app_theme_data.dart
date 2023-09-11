import 'package:flutter/material.dart';

Color black = const Color.fromRGBO(25, 25, 25, 1.0);
Color gold = const Color.fromRGBO(209, 184, 119, 1.0);
Color grey = const Color.fromRGBO(158, 158, 158, 1.0);
Color darkGrey = const Color.fromRGBO(38, 39, 41, 1.0);

ThemeData getAppThemeData(BuildContext context) {
  return ThemeData(
      searchViewTheme: SearchViewThemeData(backgroundColor: darkGrey),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: MaterialStateProperty.all(darkGrey),
      ),
      scaffoldBackgroundColor: black,
      buttonTheme: ButtonThemeData(
        buttonColor: gold, // Set the button background color to gold
      ),
      textTheme: TextTheme(labelMedium: TextStyle(color: grey, fontSize: 20)),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: darkGrey,
        filled: true, // don't forget this line
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            // Color when unchecked
            if (states.contains(MaterialState.selected)) {
              return gold;
            }
            return darkGrey;
          },
        ),
        splashRadius: 18.0, // Customize the splash radius
      ),
      useMaterial3: true);
}

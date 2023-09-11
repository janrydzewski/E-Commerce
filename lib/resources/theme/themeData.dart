import 'package:flutter/material.dart';

import 'package:ecommerce/resources/resources.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorProvider.backgroundLight,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: ColorProvider.backgroundLight,
    iconTheme: IconThemeData(
      color: ColorProvider.mainTextLight,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorProvider.backgroundDark,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: ColorProvider.backgroundDark,
    iconTheme: IconThemeData(
      color: ColorProvider.mainTextLight,
    ),
  ),
);

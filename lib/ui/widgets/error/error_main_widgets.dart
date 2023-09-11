import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

mainErrorWidget(bool isDarkMode) {
  return Center(
    child: reusableText("Error has occured.",
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight),
  );
}

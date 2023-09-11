import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

List<Column> pagesList(bool isDarkMode) {
  List<Column> pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/page_view_1.png"),
        reusableText("We provide high\nquality products just\nfor you",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: 28),
        SizedBox(
          height: 100.h,
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/page_view_2.png"),
        reusableText("Your satisfaction is\nour number one\npriority",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: 28),
        SizedBox(
          height: 100.h,
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/page_view_3.png"),
        reusableText("Let's fulfill your daily\nneeds with Evira\nright now!",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: 28),
        SizedBox(
          height: 100.h,
        ),
      ],
    ),
  ];
  return pages;
}

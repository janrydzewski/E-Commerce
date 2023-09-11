import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mainPhoto() {
  return Container(
    height: 812.h,
    width: 375.w,
    foregroundDecoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.black54,
        ],
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        stops: [0, 50],
      ),
    ),
    child: Image.asset(
      "assets/images/welcome.png",
      fit: BoxFit.fitWidth,
    ),
  );
}

mainTextInit() {
  return Container(
    margin: EdgeInsets.only(top: 550.h, left: 30.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: reusableText("Welcome to", fontSize: 38),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          child: reusableText("Evira",
              fontSize: 72, fontWeight: FontWeight.w800, letterSpacing: 3),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.h, right: 15.w),
          child: reusableText(
              "The best e-commerce app of the century for your daily needs!",
              fontSize: 15),
        )
      ],
    ),
  );
}

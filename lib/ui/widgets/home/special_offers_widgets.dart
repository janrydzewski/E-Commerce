import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

var pageViewItems = [
  Container(
    width: 375.w,
    height: 170.h,
    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
    decoration: BoxDecoration(
      color: ColorProvider.fifthElementLight,
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: reusableText("30%",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600),
              margin: EdgeInsets.only(top: 15.h),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: reusableText("Today's Special!",
                  fontColor: ColorProvider.mainTextLight, fontSize: 15.sp),
            ),
            Container(
              child: reusableText(
                  "Get discount for every\norder, only valid for today",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          height: 170.h,
          child: Image.asset("assets/images/special_offer.png"),
        )
      ],
    ),
  ),
  Container(
    width: 375.w,
    height: 170.h,
    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
    decoration: BoxDecoration(
      color: ColorProvider.fifthElementLight,
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: reusableText("25%",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600),
              margin: EdgeInsets.only(top: 15.h),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: reusableText("Weekends Deals!",
                  fontColor: ColorProvider.mainTextLight, fontSize: 15.sp),
            ),
            Container(
              child: reusableText(
                  "Get discount for every\norder, only valid for today",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 50.w),
          height: 150.h,
          child: Image.asset("assets/images/headphones.png"),
        )
      ],
    ),
  ),
  Container(
    width: 375.w,
    height: 170.h,
    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
    decoration: BoxDecoration(
      color: ColorProvider.fifthElementLight,
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: reusableText("40%",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600),
              margin: EdgeInsets.only(top: 15.h),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: reusableText("New Arrivals!",
                  fontColor: ColorProvider.mainTextLight, fontSize: 15.sp),
            ),
            Container(
              child: reusableText(
                  "Get discount for every\norder, only valid for today",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          height: 150.h,
          margin: EdgeInsets.only(left: 55.w),
          child: Image.asset("assets/images/ring.png"),
        )
      ],
    ),
  ),
  Container(
    width: 375.w,
    height: 170.h,
    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
    decoration: BoxDecoration(
      color: ColorProvider.fifthElementLight,
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: reusableText("20%",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600),
              margin: EdgeInsets.only(top: 15.h),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: reusableText("Black Friday!",
                  fontColor: ColorProvider.mainTextLight, fontSize: 15.sp),
            ),
            Container(
              child: reusableText(
                  "Get discount for every\norder, only valid for today",
                  fontColor: ColorProvider.mainTextLight,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          height: 125.h,
          margin: EdgeInsets.only(left: 30.w),
          child: Image.asset("assets/images/camera.png"),
        )
      ],
    ),
  ),
];

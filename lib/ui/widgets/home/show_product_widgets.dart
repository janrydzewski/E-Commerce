import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

sizeNumberListViewItem(int index, bool isSelected) {
  String text = "";

  switch (index) {
    case 0:
      text = "36";
      break;
    case 1:
      text = "37";
      break;
    case 2:
      text = "38";
      break;
    case 3:
      text = "39";
      break;
    case 4:
      text = "40";
      break;
    case 5:
      text = "41";
      break;
    case 6:
      text = "42";
      break;
    case 7:
      text = "43";
      break;
    case 8:
      text = "44";
      break;
  }
  return Container(
    //margin: EdgeInsets.symmetric(horizontal: 5.w),
    height: 25.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isSelected
          ? ColorProvider.secondaryElementLight
          : ColorProvider.backgroundLight,
      border: Border.all(color: ColorProvider.secondaryElementLight),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: reusableText(text,
          fontColor: isSelected
              ? ColorProvider.mainTextLight
              : ColorProvider.mainTextLight,
          fontSize: 13,
          fontWeight: FontWeight.w600),
    ),
  );
}

sizeLetterListViewItem(int index, bool isSelected) {
  String text = "";

  switch (index) {
    case 0:
      text = "S";
      break;
    case 1:
      text = "M";
      break;
    case 2:
      text = "L";
      break;
  }
  return Container(
    height: 25.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isSelected
          ? ColorProvider.secondaryElementLight
          : ColorProvider.backgroundLight,
      border: Border.all(color: ColorProvider.secondaryElementLight),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: reusableText(text,
          fontColor: isSelected
              ? ColorProvider.mainTextLight
              : ColorProvider.mainTextLight,
          fontSize: 13,
          fontWeight: FontWeight.w500),
    ),
  );
}

sizeColorListViewItem(int index, bool isSelected) {
  Color color = Colors.black54;

  switch (index) {
    case 0:
      color = Colors.blueGrey;
    case 1:
      color = Colors.brown;
    case 2:
      color = Colors.grey;
    case 3:
      color = Colors.black87;
  }

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    height: 25.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      //border: Border.all(color: ColorProvider.primarySecondaryElement),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: isSelected
          ? Icon(
              Icons.circle,
              size: 10.w,
            )
          : Container(
              width: 10.w,
            ),
    ),
  );
}

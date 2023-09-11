import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

buildAppBarAdmin(String text, bool isDarkMode) {
  return AppBar(
    title: reusableText(text,
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontSize: 20,
        fontWeight: FontWeight.w600),
    iconTheme: IconThemeData(
        color: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight),
  );
}

reusableTextFieldAdmin(
    String text, TextEditingController textEditingController, bool isDarkMode) {
  return Container(
    width: 375.w,
    height: 60.h,
    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isDarkMode
          ? ColorProvider.sixthElementDark
          : ColorProvider.sixthElementLight,
    ),
    child: TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          icon: const Icon(Icons.insert_drive_file_outlined),
          iconColor: ColorProvider.thirdElementLight,
          label: Container(
            margin: EdgeInsets.only(top: 3.w),
            child: reusableText(text,
                fontSize: 14,
                fontColor: isDarkMode
                    ? ColorProvider.thirdTextDark
                    : ColorProvider.thirdTextLight),
          )),
      autocorrect: false,
    ),
  );
}

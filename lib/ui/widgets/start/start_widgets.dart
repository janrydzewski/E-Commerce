import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

reusableButtonStart(String text, bool isDarkMode) {
  return GestureDetector(
    onTap: () {
      print("Continue with: ${text}");
    },
    child: Container(
      padding: EdgeInsets.all(8),
      width: 315.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isDarkMode
            ? ColorProvider.sixthElementDark
            : ColorProvider.sixthElementLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 25.w,
              child: Image.asset("assets/icons/${text.toLowerCase()}.png")),
          SizedBox(
            width: 15.w,
          ),
          reusableText("Continue with ${text}",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 13),
        ],
      ),
    ),
  );
}

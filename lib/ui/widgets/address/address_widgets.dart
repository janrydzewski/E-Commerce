import 'package:flutter/material.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

reusableTextFieldAddress(TextEditingController textEditingController,
    bool isDarkMode, bool address, Function() func) {
  return Container(
    width: 310.w,
    height: address ? 80.h : 55.h,
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isDarkMode
          ? ColorProvider.sixthElementDark
          : ColorProvider.sixthElementLight,
    ),
    child: TextFormField(
      controller: textEditingController,
      maxLines: address ? 2 : 1,
      style: GoogleFonts.poppins(
        fontSize: 11.sp,
        color: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: address ? func : () {},
          child: Icon(
            Icons.location_on_rounded,
            color: address
                ? isDarkMode
                    ? ColorProvider.mainElementDark
                    : ColorProvider.mainElementLight
                : Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      autocorrect: false,
    ),
  );
}

reusableButtonAddAddress(String text, Function() func, bool isDarkMode) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 150.w,
        height: 45.h,
        margin: EdgeInsets.only(top: 25.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isDarkMode
              ? ColorProvider.mainElementDark
              : ColorProvider.mainElementLight,
        ),
        child: reusableText(text,
            fontColor: isDarkMode
                ? ColorProvider.secondaryTextDark
                : ColorProvider.secondaryTextLight,
            fontSize: 14)),
  );
}

import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/bloc/bloc.dart';

reusableText(String text,
    {double fontSize = 24,
    Color fontColor = ColorProvider.mainText,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.poppins(
        fontSize: fontSize.sp,
        color: fontColor,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing),
  );
}

reusableTextMaxLines(String text,
    {double fontSize = 24,
    Color fontColor = ColorProvider.mainText,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: 3,
    style: GoogleFonts.poppins(
      fontSize: fontSize.sp,
      color: fontColor,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    ),
  );
}

reusableButton(String text, Function() func, bool isDarkMode) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 310.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDarkMode
            ? ColorProvider.mainElementDark
            : ColorProvider.mainElementLight,
      ),
      child: reusableText(text,
          fontColor: isDarkMode
              ? ColorProvider.secondaryTextDark
              : ColorProvider.secondaryTextLight,
          fontSize: 16),
    ),
  );
}

reusableButtonProduct(String text, Function() func, bool isDarkMode) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 200.w,
        height: 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDarkMode
              ? ColorProvider.mainElementDark
              : ColorProvider.mainElementLight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              color: isDarkMode
                  ? ColorProvider.secondaryTextDark
                  : ColorProvider.secondaryTextLight,
              size: 18.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            reusableText(text,
                fontColor: isDarkMode
                    ? ColorProvider.secondaryTextDark
                    : ColorProvider.secondaryTextLight,
                fontSize: 14),
          ],
        )),
  );
}

reusableButtonCart(
    String text, Function() func, bool isDarkMode, bool isArrowNeed) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 200.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isDarkMode
            ? ColorProvider.mainElementDark
            : ColorProvider.mainElementLight,
      ),
      child: isArrowNeed
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableText(text,
                    fontColor: isDarkMode
                        ? ColorProvider.secondaryTextDark
                        : ColorProvider.secondaryTextLight,
                    fontSize: 14),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: isDarkMode
                      ? ColorProvider.secondaryTextDark
                      : ColorProvider.secondaryTextLight,
                  size: 18.sp,
                ),
              ],
            )
          : reusableText(text,
              fontColor: isDarkMode
                  ? ColorProvider.secondaryTextDark
                  : ColorProvider.secondaryTextLight,
              fontSize: 14),
    ),
  );
}

reusableButtonCartDelete(String text, Function() func, bool bool, isDarkMode) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 150.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bool
              ? isDarkMode
                  ? ColorProvider.mainElementDark
                  : ColorProvider.mainElementLight
              : isDarkMode
                  ? ColorProvider.fifthElementDark
                  : ColorProvider.fifthElementLight,
        ),
        child: reusableText(text,
            fontColor: bool
                ? isDarkMode
                    ? ColorProvider.secondaryTextDark
                    : ColorProvider.secondaryTextLight
                : isDarkMode
                    ? ColorProvider.mainTextDark
                    : ColorProvider.mainTextLight,
            fontSize: 13)),
  );
}

reusableProductItem(ProductModel product, bool isDarkMode) {
  return SizedBox(
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 160.w,
              height: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isDarkMode
                    ? ColorProvider.fifthElementDark
                    : ColorProvider.fifthElementLight,
              ),
            ),
            SizedBox(
                width: 120.w,
                height: 120.w,
                child: Image.network(product.photoUrl)),
          ],
        ),
        Container(
          width: 150.w,
          margin: EdgeInsets.only(top: 3.h),
          child: reusableText(product.name,
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
            width: 150.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 2.w),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_half_outlined,
                          size: 20,
                        ),
                        reusableText(product.opinion,
                            fontColor: isDarkMode
                                ? ColorProvider.mainTextDark
                                : ColorProvider.mainTextLight,
                            fontSize: 13.sp,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600),
                      ],
                    )),
                Container(
                  child: reusableText("|",
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                      fontSize: 13.sp,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    height: 20.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isDarkMode
                          ? ColorProvider.fifthElementDark
                          : ColorProvider.fifthElementLight,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 2.h),
                      child: reusableText("${product.soldCounter} sold",
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight,
                          fontSize: 9.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            )),
        SizedBox(
          width: 150.w,
          child: reusableText("\$${product.price}.00",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

buildAppBar(String text, bool isDarkMode) {
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

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: isDarkMode
            ? ColorProvider.backgroundDark
            : ColorProvider.backgroundLight,
        color: isDarkMode
            ? ColorProvider.secondaryElementDark
            : ColorProvider.secondaryElementLight,
        strokeWidth: 5,
      ),
    );
  }
}

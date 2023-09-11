import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:ecommerce/bloc/bloc.dart';

reusableProfileTab(
    IconData icon, String text, Function() func, bool isDarkMode) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: 375.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: text == "Logout"
                    ? ColorProvider.primaryFourthTextLight
                    : isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
              ),
              SizedBox(
                width: 15.w,
              ),
              reusableText(text,
                  fontColor: text == "Logout"
                      ? ColorProvider.primaryFourthTextLight
                      : isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ],
          ),
          Container(
            child: text == "Logout"
                ? Container()
                : Icon(
                    Icons.arrow_forward_ios,
                    color: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    size: 18.w,
                  ),
          )
        ],
      ),
    ),
  );
}

changeThemeWidget(bool isDarkMode) {
  return BlocBuilder<ThemeCubit, Brightness>(
    builder: (context, state) {
      final isDarkMode = state == Brightness.dark;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: 375.w,
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight,
                ),
                SizedBox(
                  width: 15.w,
                ),
                reusableText("Dark Mode",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ],
            ),
            Switch(
              activeColor: isDarkMode
                  ? ColorProvider.thirdElementDark
                  : ColorProvider.thirdElementLight,
              value: state.index == 1 ? false : true,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
            )
          ],
        ),
      );
    },
  );
}

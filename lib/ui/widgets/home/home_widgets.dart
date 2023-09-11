import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

searchField(TextEditingController textEditingController, bool isDarkMode) {
  return Container(
    width: 375.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isDarkMode
          ? ColorProvider.sixthElementDark
          : ColorProvider.sixthElementLight,
    ),
    margin: EdgeInsets.symmetric(horizontal: 25.w),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextField(
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
            icon: const Icon(Icons.search_outlined),
            iconColor: ColorProvider.thirdElementLight,
            label: Container(
              margin: EdgeInsets.only(top: 3.w),
              child: reusableText("Search",
                  fontSize: 14, fontColor: ColorProvider.thirdTextLight),
            )),
        autocorrect: false,
      ),
    ),
  );
}

List<Container> pageViewItemsList(bool isDarkMode) {
  List<Container> pageViewItems = [
    Container(
      width: 375.w,
      height: 170.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: reusableText("30%",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600),
                margin: EdgeInsets.only(top: 15.h),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: reusableText("Today's Special!",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 15.sp),
              ),
              Container(
                child: reusableText(
                    "Get discount for every\norder, only valid for today",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
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
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: reusableText("25%",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600),
                margin: EdgeInsets.only(top: 15.h),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: reusableText("Weekends Deals!",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 15.sp),
              ),
              Container(
                child: reusableText(
                    "Get discount for every\norder, only valid for today",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
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
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: reusableText("40%",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600),
                margin: EdgeInsets.only(top: 15.h),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: reusableText("New Arrivals!",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 15.sp),
              ),
              Container(
                child: reusableText(
                    "Get discount for every\norder, only valid for today",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
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
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: reusableText("20%",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600),
                margin: EdgeInsets.only(top: 15.h),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: reusableText("Black Friday!",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 15.sp),
              ),
              Container(
                child: reusableText(
                    "Get discount for every\norder, only valid for today",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
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
  return pageViewItems;
}

categoryButton(String text, bool isDarkMode, BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.go('/home/category_product', extra: text);
    },
    child: Container(
      margin: EdgeInsets.all(8),
      width: 75.w,
      height: 90.h,
      child: Column(
        children: [
          Container(
            width: 55.w,
            height: 55.h,
            margin: EdgeInsets.only(bottom: 8.h),
            child: CircleAvatar(
              backgroundColor: isDarkMode
                  ? ColorProvider.fifthElementDark
                  : ColorProvider.fifthElementLight,
              child: Image.asset(
                "assets/icons/${text.toLowerCase()}.png",
                width: 25.w,
                color: isDarkMode
                    ? ColorProvider.secondaryElementDark
                    : ColorProvider.secondaryElementLight,
              ),
            ),
          ),
          reusableTextMaxLines(text,
              fontSize: 12.sp,
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontWeight: FontWeight.w600),
        ],
      ),
    ),
  );
}

categoryListViewItem(int index, bool isSelected, bool isDarkMode) {
  String text = "";

  switch (index) {
    case 0:
      text = "All";
      break;
    case 1:
      text = "Clothes";
      break;
    case 2:
      text = "Shoes";
      break;
    case 3:
      text = "Bags";
      break;
    case 4:
      text = "Electronics";
      break;
    case 5:
      text = "Watch";
      break;
    case 6:
      text = "Jewelry";
      break;
    case 7:
      text = "Kitchen";
      break;
    case 8:
      text = "Toys";
      break;
  }
  return Container(
    //width: 80.w,
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    height: 15.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isDarkMode
          ? isSelected
              ? ColorProvider.fifthElementDark
              : ColorProvider.backgroundDark
          : isSelected
              ? ColorProvider.secondaryElementLight
              : ColorProvider.backgroundLight,
      border: Border.all(
          color: isDarkMode
              ? ColorProvider.secondaryElementDark
              : ColorProvider.secondaryElementLight),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: reusableText(text,
          fontColor: isDarkMode
              ? isSelected
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextDark
              : isSelected
                  ? ColorProvider.secondaryTextLight
                  : ColorProvider.mainTextLight,
          fontSize: 13,
          fontWeight: FontWeight.w500),
    ),
  );
}

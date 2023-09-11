import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

editProductListItem(ProductModel product, bool isDarkMode) {
  return Container(
    decoration: BoxDecoration(
      color: isDarkMode
          ? ColorProvider.sixthElementDark
          : ColorProvider.sixthElementLight,
      borderRadius: BorderRadius.circular(20),
    ),
    margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    padding: EdgeInsets.symmetric(vertical: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 100.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDarkMode
                      ? ColorProvider.fifthElementDark
                      : ColorProvider.fifthElementLight,
                ),
              ),
              SizedBox(
                  width: 60.w,
                  height: 60.w,
                  child: Image.network(product.photoUrl)),
            ],
          ),
        ),
        SizedBox(
          width: 230.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //width: 150.w,
                margin: EdgeInsets.only(top: 3.h),
                child: reusableText("Product name: ${product.name}",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 11.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                //width: 150.w,
                margin: EdgeInsets.only(top: 3.h),
                child: reusableText("Product id: ${product.id}",
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight,
                    fontSize: 9.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:ecommerce/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

selectAddress(AddressModel addressModel, bool isDarkMode, Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 375.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDarkMode
              ? ColorProvider.sixthElementDark
              : ColorProvider.sixthElementLight,
        ),
        margin:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 25.h),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 20.w, right: 15.w, top: 5.h),
          leading: Icon(
            Icons.location_city_outlined,
            size: 35.w,
          ),
          title: reusableText(addressModel.name, fontSize: 18),
          subtitle: reusableText(addressModel.address, fontSize: 10),
          trailing: Icon(
            Icons.edit,
            size: 20.w,
          ),
        )),
  );
}

selectShipping(List<String> shippingModel, bool isDarkMode, Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 375.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDarkMode
              ? ColorProvider.sixthElementDark
              : ColorProvider.sixthElementLight,
        ),
        margin:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 25.h),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 20.w, right: 15.w, top: 5.h),
          leading: Icon(
            Icons.location_city_outlined,
            size: 35.w,
          ),
          title: reusableText(shippingModel[0], fontSize: 18),
          subtitle: reusableText(shippingModel[1], fontSize: 10),
          trailing: Icon(
            Icons.edit,
            size: 20.w,
          ),
        )),
  );
}

addressForm(AddressModel addressModel, bool isDarkMode, bool isSelected) {
  return Container(
      width: 375.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isDarkMode
            ? ColorProvider.sixthElementDark
            : ColorProvider.sixthElementLight,
      ),
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20.w, right: 15.w, top: 5.h),
        leading: Icon(
          Icons.location_city_outlined,
          size: 35.w,
        ),
        title: reusableText(addressModel.name, fontSize: 18),
        subtitle: reusableText(addressModel.address, fontSize: 10),
        trailing: isSelected
            ? Icon(
                Icons.circle,
                color: isDarkMode
                    ? ColorProvider.thirdElementDark
                    : ColorProvider.thirdElementLight,
              )
            : Icon(
                Icons.circle_outlined,
                color: isDarkMode
                    ? ColorProvider.thirdElementDark
                    : ColorProvider.thirdElementLight,
              ),
      ));
}

shippingForm(int index, bool isDarkMode, bool isSelected) {
  return Container(
      width: 375.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isDarkMode
            ? ColorProvider.sixthElementDark
            : ColorProvider.sixthElementLight,
      ),
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20.w, right: 15.w, top: 5.h),
        leading: Icon(
          Icons.location_city_outlined,
          size: 35.w,
        ),
        title: reusableText(shippingList[index][0], fontSize: 18),
        subtitle: reusableText(shippingList[index][1], fontSize: 10),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            reusableText("\$${shippingList[index][2]}", fontSize: 18),
            SizedBox(
              width: 10.w,
            ),
            isSelected
                ? Icon(
                    Icons.circle,
                    color: isDarkMode
                        ? ColorProvider.thirdElementDark
                        : ColorProvider.thirdElementLight,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: isDarkMode
                        ? ColorProvider.thirdElementDark
                        : ColorProvider.thirdElementLight,
                  ),
          ],
        ),
      ));
}

reusableButtonAddress(String text, Function() func, bool isDarkMode) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 200.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isDarkMode
              ? ColorProvider.thirdElementDark
              : ColorProvider.thirdElementLight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableText(text,
                fontColor: isDarkMode
                    ? ColorProvider.mainTextDark
                    : ColorProvider.mainTextLight,
                fontSize: 14),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.arrow_forward,
              color: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              size: 18.sp,
            ),
          ],
        )),
  );
}

inputCardDetails(
  bool isDarkMode,
  Widget widget,
) {
  return Container(
    // width: 375.w,
    //height: 300.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isDarkMode
          ? ColorProvider.sixthElementDark
          : ColorProvider.sixthElementLight,
    ),
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
    child: widget,
  );
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

reusableTextField(
    String text, TextEditingController textEditingController, bool isDarkMode) {
  return Container(
    width: 310.w,
    height: 60.h,
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
          icon: Icon(text == "Email" ? Icons.email : Icons.lock),
          iconColor: ColorProvider.thirdElementLight,
          label: Container(
            margin: EdgeInsets.only(top: 3.w),
            child: reusableText(text,
                fontSize: 14, fontColor: ColorProvider.thirdTextLight),
          )),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (text == "Email") {
          return value != null && !EmailValidator.validate(value)
              ? "Enter a valid email"
              : null;
        } else if (text == "Password") {
          return value != null && value.length < 6
              ? "Enter min. 6 characters"
              : null;
        }
        return null;
      },
      autocorrect: false,
      obscureText: text == "Password" ? true : false,
    ),
  );
}

reusableThirdLogin(String text, bool isDarkMode) {
  return Container(
    width: 60.w,
    height: 40.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: isDarkMode
          ? ColorProvider.sixthElementDark
          : ColorProvider.sixthElementLight,
    ),
    child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset("assets/icons/${text}.png")),
  );
}

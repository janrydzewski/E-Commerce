import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

reusableTextFieldEdit(
    String text, TextEditingController textEditingController, bool isDarkMode) {
  return Container(
    width: 375.w,
    height: 60.h,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
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
          label: Container(
            margin: EdgeInsets.only(top: 3.w),
            child: reusableText(text,
                fontSize: 14,
                fontColor: isDarkMode
                    ? ColorProvider.thirdTextDark
                    : ColorProvider.thirdTextLight),
          )),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (text == "Email") {
          return value != null && !EmailValidator.validate(value)
              ? "Enter a valid email"
              : null;
        }
        return null;
      },
      autocorrect: false,
    ),
  );
}

reusableDatePicker(String text, TextEditingController textEditingController,
    BuildContext context, bool isDarkMode) {
  return Container(
    width: 375.w,
    height: 60.h,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
        textEditingController.text =
            DateFormat.yMd().format(pickedDate!).toString();
      },
      autocorrect: false,
    ),
  );
}

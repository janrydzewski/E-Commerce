import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

loginToYourAccountWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
    child: reusableText("Login to your\nAccount",
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontSize: 38,
        fontWeight: FontWeight.w600),
  );
}

formSignInWidget(
    GlobalKey<FormState> _formKey,
    TextEditingController _emailController,
    TextEditingController _passwordController,
    bool isDarkMode) {
  return Form(
    key: _formKey,
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25.h, bottom: 30.h),
          child: reusableTextFieldAdmin("Email", _emailController, isDarkMode),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 15.h),
          child: reusableTextFieldAdmin(
              "Password", _passwordController, isDarkMode),
        ),
      ],
    ),
  );
}

signInButton(
    GlobalKey<FormState> _formKey,
    TextEditingController _emailController,
    TextEditingController _passwordController,
    bool isDarkMode,
    BuildContext context) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
    child: reusableButton("Sign in", () {
      if (_formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
            SignInRequested(_emailController.text, _passwordController.text));
      }
      print("Sign in");
    }, isDarkMode),
  );
}

forgotPasswordWidget(bool isDarkMode) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 30.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: reusableText("Forgot the password?",
          fontColor: isDarkMode
              ? ColorProvider.mainTextDark
              : ColorProvider.mainTextLight,
          fontSize: 15),
    ),
  );
}

dividerWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 35.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: reusableText("or continue with",
              fontColor: isDarkMode
                  ? ColorProvider.thirdTextDark
                  : ColorProvider.thirdTextLight,
              fontSize: 16),
        ),
        Expanded(
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        )
      ],
    ),
  );
}

thirdAppWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        reusableThirdLogin("facebook", isDarkMode),
        reusableThirdLogin("google", isDarkMode),
        reusableThirdLogin("apple", isDarkMode),
      ],
    ),
  );
}

dontHaveAccountWidget(bool isDarkMode, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        reusableText("Don't have an account? ",
            fontColor: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
            fontSize: 14),
        SizedBox(
          width: 5.w,
        ),
        GestureDetector(
          onTap: () {
            context.go('/signUp');
          },
          child: reusableText("Sign up",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 15),
        ),
      ],
    ),
  );
}

createYourAccountWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
    child: reusableText("Create your\nAccount",
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontSize: 38,
        fontWeight: FontWeight.w600),
  );
}

formSignUpWidget(
    GlobalKey<FormState> _formKey,
    TextEditingController _emailController,
    TextEditingController _passwordController,
    bool isDarkMode) {
  return Form(
    key: _formKey,
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25.h, bottom: 30.h),
          child: reusableTextFieldAdmin("Email", _emailController, isDarkMode),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 15.h),
          child: reusableTextFieldAdmin(
              "Password", _passwordController, isDarkMode),
        ),
      ],
    ),
  );
}

signUpButton(
    GlobalKey<FormState> _formKey,
    TextEditingController _emailController,
    TextEditingController _passwordController,
    bool isDarkMode,
    BuildContext context) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
    child: reusableButton("Sign up", () {
      if (_formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
            SignUpRequested(_emailController.text, _passwordController.text));
      }
    }, isDarkMode),
  );
}

dividerSignUpWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 35.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: reusableText("or continue with",
              fontColor: isDarkMode
                  ? ColorProvider.thirdTextDark
                  : ColorProvider.thirdTextLight,
              fontSize: 16),
        ),
        Expanded(
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        ),
      ],
    ),
  );
}

alreadyHaveAnAccountWidget(bool isDarkMode, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        reusableText("Already have an account? ",
            fontColor: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
            fontSize: 14),
        SizedBox(
          width: 5.w,
        ),
        GestureDetector(
          onTap: () {
            context.go('/signIn');
          },
          child: reusableText("Sign in",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 15),
        ),
      ],
    ),
  );
}

welcomeWidget() {
  return Container(
    height: 250.h,
    margin: EdgeInsets.symmetric(horizontal: 30.w),
    alignment: Alignment.center,
    width: 375.w,
    child: Image.asset("assets/images/welcome_1.png"),
  );
}

letsYouInWidget(bool isDarkMode) {
  return Container(
    height: 95.h,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(),
    child: reusableText("Let's you in",
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontSize: 36,
        fontWeight: FontWeight.w600),
  );
}

orWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 35.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: reusableText("or",
              fontColor: isDarkMode
                  ? ColorProvider.thirdTextDark
                  : ColorProvider.thirdTextLight,
              fontSize: 16),
        ),
        Expanded(
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        )
      ],
    ),
  );
}

signInWithPasswordButton(bool isDarkMode, BuildContext context) {
  return Container(
    height: 50.h,
    margin: EdgeInsets.symmetric(vertical: 15.h),
    child: reusableButton("Sign in with password", () {
      context.go('/signIn');
    }, isDarkMode),
  );
}

dontHaveAnAccountStartWidget(bool isDarkMode, BuildContext context) {
  return Container(
    height: 25.h,
    margin: EdgeInsets.only(top: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        reusableText("Don't have an account? ",
            fontColor: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
            fontSize: 14),
        GestureDetector(
          onTap: () {
            context.go('/signUp');
          },
          child: Container(
            child: reusableText("Sign up",
                fontColor: isDarkMode
                    ? ColorProvider.mainTextDark
                    : ColorProvider.mainTextLight,
                fontSize: 15),
          ),
        ),
      ],
    ),
  );
}

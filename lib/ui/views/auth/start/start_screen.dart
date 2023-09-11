import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return SizedBox(
      width: 375.w,
      height: 812.h,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ColorProvider.backgroundDark
            : ColorProvider.backgroundLight,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                welcomeWidget(),
                letsYouInWidget(isDarkMode),
                reusableButtonStart("Facebook", isDarkMode),
                reusableButtonStart("Google", isDarkMode),
                reusableButtonStart("Apple", isDarkMode),
                orWidget(isDarkMode),
                signInWithPasswordButton(isDarkMode, context),
                dontHaveAnAccountStartWidget(isDarkMode, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

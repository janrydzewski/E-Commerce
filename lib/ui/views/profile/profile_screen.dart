import 'package:ecommerce/ui/widgets/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Brightness>(
      builder: (context, state) {
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
                  children: [
                    profileTopBar(isDarkMode),
                    profileUserInfoWidget(isDarkMode),
                    profileSelectWidget(context, isDarkMode),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

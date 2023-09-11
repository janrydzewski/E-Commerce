import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

profileTopBar(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Image.asset(
            "assets/images/logo.png",
            color: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
          ),
        ),
        Container(
          child: reusableText("Profile",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
      ],
    ),
  );
}

profileUserInfoWidget(bool isDarkMode) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      if (state.userStatus == UserStatus.loading) {
        return const Loading();
      } else if (state.userStatus == UserStatus.loaded) {
        UserModel? userModel = context.read<UserBloc>().state.userModel;
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: isDarkMode
                          ? ColorProvider.mainElementDark
                          : ColorProvider.mainElementLight,
                    ),
                    image: userModel!.profilePhoto.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(userModel.profilePhoto),
                            fit: BoxFit.cover)
                        : null,
                    shape: BoxShape.circle),
                child: userModel.profilePhoto.isEmpty
                    ? Icon(Icons.person_rounded,
                        color: isDarkMode
                            ? ColorProvider.secondaryElementDark
                            : ColorProvider.secondaryElementLight,
                        size: 100.w)
                    : null,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              child: reusableText(
                  userModel.fullName.isNotEmpty
                      ? userModel.fullName
                      : "Your full name",
                  fontColor: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.h),
              child: reusableText(
                  userModel.phoneNumber.isNotEmpty
                      ? userModel.phoneNumber
                      : "Your phone number",
                  fontColor: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight,
                  fontSize: 18),
            ),
          ],
        );
      }
      return Container();
    },
  );
}

profileSelectWidget(BuildContext context, bool isDarkMode) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
        child: const Divider(
          thickness: 1,
        ),
      ),
      reusableProfileTab(Icons.person_outline, "Edit profile", () {
        context.go('/profile/edit_profile');
      }, isDarkMode),
      reusableProfileTab(Icons.location_on_outlined, "Address", () {
        context.go('/profile/select_address');
      }, isDarkMode),
      reusableProfileTab(
          Icons.notifications_none, "Notification", () {}, isDarkMode),
      reusableProfileTab(
          Icons.account_balance_wallet_outlined, "Payment", () {}, isDarkMode),
      reusableProfileTab(Icons.shield_outlined, "Security", () {}, isDarkMode),
      reusableProfileTab(
          Icons.language_outlined, "Language", () {}, isDarkMode),
      changeThemeWidget(isDarkMode),
      reusableProfileTab(
          Icons.lock_outline, "Privacy Policy", () {}, isDarkMode),
      reusableProfileTab(
          Icons.help_outline_outlined, "Help Center", () {}, isDarkMode),
      reusableProfileTab(
          Icons.people_outline, "Invite Friends", () {}, isDarkMode),
      reusableProfileTab(Icons.admin_panel_settings_outlined, "Admin", () {
        context.go('/profile/admin');
      }, isDarkMode),
      reusableProfileTab(Icons.error, "Throw Exception", () {
        throw FormatException();
      }, isDarkMode),
      reusableProfileTab(Icons.logout_outlined, "Logout", () {
        context.read<AuthBloc>().add(SignOutRequested());
        context.go('/initWelcome');
      }, isDarkMode),
    ],
  );
}

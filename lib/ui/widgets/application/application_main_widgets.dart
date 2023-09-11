import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

applicationThemeData(bool isDarkMode) {
  return ThemeData(
    canvasColor: isDarkMode
        ? ColorProvider.backgroundDark
        : ColorProvider.backgroundLight,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}

bottomNavigationBarWidget(
    bool isDarkMode, BuildContext context, ApplicationState state) {
  return BottomNavigationBar(
    unselectedItemColor: isDarkMode
        ? ColorProvider.fourthElementDark
        : ColorProvider.fourthElementLight,
    selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 10.sp,
        color: isDarkMode
            ? ColorProvider.secondaryElementDark
            : ColorProvider.secondaryElementLight),
    unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 10.sp,
        color: isDarkMode
            ? ColorProvider.fourthElementDark
            : ColorProvider.fourthElementLight),
    selectedItemColor: isDarkMode
        ? ColorProvider.secondaryElementDark
        : ColorProvider.secondaryElementLight,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    items: bottomNavigationBarItemsList(isDarkMode),
    currentIndex: state.index,
    onTap: (value) {
      switch (value) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/cart');
          break;
        case 2:
          context.go('/orders');
          break;
        case 3:
          context.go('/wallet');
          break;
        case 4:
          context.go('/profile');
          break;
      }
      context.read<ApplicationBloc>().add(ChangeApplicationEvent(value));
    },
  );
}

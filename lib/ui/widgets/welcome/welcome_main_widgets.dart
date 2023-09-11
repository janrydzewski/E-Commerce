import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

mainWelcomeWidget(PageController pageController, bool isDarkMode,
    WelcomeState state, BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      PageView(
        controller: pageController,
        children: pagesList(isDarkMode),
        onPageChanged: (value) {
          state.index = value;
          context.read<WelcomeBloc>().add(const WelcomeEvent());
        },
      ),
      Positioned(
          top: 650.h,
          child: DotsIndicator(
            dotsCount: 3,
            decorator: DotsDecorator(
                color: isDarkMode
                    ? ColorProvider.thirdElementDark
                    : ColorProvider.thirdElementLight,
                activeColor: isDarkMode
                    ? ColorProvider.mainElementDark
                    : ColorProvider.mainElementLight),
            position: state.index,
          )),
      Positioned(
        top: 700.h,
        child: reusableButton(state.index < 2 ? "Next" : "Get started", () {
          if (state.index < 2) {
            pageController.animateToPage(state.index + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate);
          } else {
            context.go('/start');
          }
        }, isDarkMode),
      ),
    ],
  );
}

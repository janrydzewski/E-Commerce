import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return SizedBox(
      width: 375.w,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ColorProvider.backgroundDark
            : ColorProvider.backgroundLight,
        body: SafeArea(
          child: Center(
            child: reusableText("Wallet",
                fontColor: isDarkMode
                    ? ColorProvider.mainTextDark
                    : ColorProvider.mainTextLight),
          ),
        ),
      ),
    );
  }
}

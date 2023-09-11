import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    context.read<AddressBloc>().add(const GetAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    final cartState = context.read<CartBloc>().state;
    final productCartList = cartState.productCartList;

    return SizedBox(
      width: 375.w,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ColorProvider.backgroundDark
            : ColorProvider.backgroundLight,
        appBar: buildAppBar("Checkout", isDarkMode),
        body: Column(
          children: [
            mainCheckoutWidget(isDarkMode, productCartList),
            checkoutContinueWidget(context, isDarkMode),
          ],
        ),
      ),
    );
  }
}

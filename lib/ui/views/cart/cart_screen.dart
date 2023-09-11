import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    context
        .read<CartBloc>()
        .add(GetCartProductsEvent(firebaseAuth.currentUser!.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartError) {
          snackBarError(context, state.message);
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (!state.isLoaded) {
            return const Loading();
          }
          final productCartList = state.productCartList;
          return SizedBox(
            width: 375.w,
            height: 812.h,
            child: Scaffold(
              backgroundColor: isDarkMode
                  ? ColorProvider.backgroundDark
                  : ColorProvider.backgroundLight,
              body: SafeArea(
                child: Column(
                  children: [
                    mainLogoCartWidget(isDarkMode),
                    mainListViewCartWidget(productCartList),
                    mainTotalPriceCart(isDarkMode, state, context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

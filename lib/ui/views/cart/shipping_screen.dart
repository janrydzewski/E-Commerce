import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Shipping extends StatefulWidget {
  const Shipping({super.key});

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocBuilder<ShippingBloc, ShippingState>(
      builder: (context, state) {
        return SizedBox(
          width: 375.w,
          child: Scaffold(
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            appBar: buildAppBar("Choose Shipping", isDarkMode),
            body: SafeArea(
              child: Column(
                children: [
                  selectShippingAddressWidget(isDarkMode, state),
                  applyButtonWidget(isDarkMode, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

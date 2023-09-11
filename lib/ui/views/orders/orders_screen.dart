import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    context.read<OrdersBloc>().add(GetOrdersEvent(0, "ongoing"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        final indexSelected = state.index;
        List<ProductOrderModel> productList = state.productList;
        return SizedBox(
          width: 375.w,
          child: Scaffold(
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            body: SafeArea(
              child: Column(
                children: [
                  orderTopBar(isDarkMode),
                  ordersWidget(
                      context, isDarkMode, indexSelected, productList, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

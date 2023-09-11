import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

orderTopBar(bool isDarkMode) {
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
          child: reusableText("My Orders",
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

ordersWidget(BuildContext context, bool isDarkMode, int indexSelected,
    List<ProductOrderModel> productList, OrdersState state) {
  return Expanded(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
          width: 375.w,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<OrdersBloc>().add(GetOrdersEvent(0, "ongoing"));
                },
                child: mainElement(
                    isDarkMode, indexSelected == 0 ? true : false, "Ongoing"),
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<OrdersBloc>()
                      .add(GetOrdersEvent(1, "completed"));
                },
                child: mainElement(
                    isDarkMode, indexSelected == 1 ? true : false, "Completed"),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: 375.w,
            child: productList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reusableText("You don't have an order yet",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight),
                      SizedBox(
                        height: 10.h,
                      ),
                      reusableText(
                          state.index == 0
                              ? "You don't have an ongoing orders at this time"
                              : "You don't have a completed orders at this time",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          fontColor: isDarkMode
                              ? ColorProvider.thirdTextDark
                              : ColorProvider.thirdTextLight),
                    ],
                  )
                : ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return OrderListItem(
                          productOrderModel: productList[index],
                          isOngoing: state.index == 0 ? true : false);
                    }),
          ),
        ),
      ],
    ),
  );
}

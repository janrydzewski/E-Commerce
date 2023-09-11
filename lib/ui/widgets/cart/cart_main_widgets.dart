import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

mainLogoCartWidget(bool isDarkMode) {
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
          child: reusableText("My Cart",
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

mainListViewCartWidget(List<ProductCartModel> productCartList) {
  return Expanded(
    child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: productCartList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: CartListItem(
              productCartModel: productCartList[index],
              isCartItem: true,
              isCheckout: false,
            ),
          );
        }),
  );
}

mainTotalPriceCart(bool isDarkMode, CartState state, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 25.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              child: reusableText("Total price",
                  fontColor: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 11),
            ),
            Container(
              child: reusableText("\$ ${state.cartPrice}.00",
                  fontColor: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight,
                  fontWeight: FontWeight.w600,
                  fontSize: 19),
            ),
          ],
        ),
        reusableButtonCart("Checkout", () {
          if (state.productCartList.isNotEmpty) {
            context.go('/cart/checkout');
          }
        }, isDarkMode, true),
      ],
    ),
  );
}

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

mainCheckoutWidget(bool isDarkMode, List<ProductCartModel> productCartList) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: Divider(
              thickness: 0.3,
              color: isDarkMode
                  ? ColorProvider.thirdTextDark
                  : ColorProvider.thirdTextLight,
            ),
          ),
          BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              if (!state.isLoaded) {
                return const Loading();
              }
              final addressList = state.addressList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    child: reusableText("Shipping address",
                        fontColor: isDarkMode
                            ? ColorProvider.mainTextDark
                            : ColorProvider.mainTextLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  selectAddress(addressList[state.index], isDarkMode, () {
                    context.push('/profile/select_address');
                  }),
                ],
              );
            },
          ),
          BlocBuilder<ShippingBloc, ShippingState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    child: reusableText("Choose Shipping",
                        fontColor: isDarkMode
                            ? ColorProvider.mainTextDark
                            : ColorProvider.mainTextLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  selectShipping(shippingList[state.index], isDarkMode, () {
                    context.push('/cart/checkout/shipping');
                  }),
                ],
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 10.h),
            child: Divider(
              thickness: 0.3,
              color: isDarkMode
                  ? ColorProvider.thirdTextDark
                  : ColorProvider.thirdTextLight,
            ),
          ),
          ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: productCartList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: CartListItem(
                    productCartModel: productCartList[index],
                    isCartItem: false,
                    isCheckout: true,
                  ),
                );
              }),
        ],
      ),
    ),
  );
}

checkoutContinueWidget(BuildContext context, bool isDarkMode) {
  return Container(
    width: 260.w,
    margin: EdgeInsets.only(bottom: 40.h, top: 20.h),
    child: reusableButtonCart("Continue to Payment", () {
      context.go("/cart/checkout/payment");
    }, isDarkMode, true),
  );
}

initialPaymentWidget(bool isDarkMode, CardFormEditController controller,
    BuildContext context, PaymentBloc paymentBloc) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: inputCardDetails(
          isDarkMode,
          CardFormField(
            controller: controller,
          ),
        ),
      ),
      Container(
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
                  child: reusableText(
                      "\$ ${context.read<CartBloc>().state.cartPrice}.00",
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ],
            ),
            reusableButtonCart("Continue to Payment", () {
              (controller.details.complete)
                  ? paymentBloc.add(
                      PaymentCreateIntent(
                        billingDetails: const BillingDetails(
                            email: "jan.rydzewski1337@gmail.com"),
                        items: context.read<CartBloc>().state.productCartList,
                      ),
                    )
                  : snackBarInfo(context, "The form is not complete.");
            }, isDarkMode, true),
          ],
        ),
      ),
    ],
  );
}

successPaymentWidget(bool isDarkMode) {
  return Column(
    children: [
      Container(
          margin: EdgeInsets.only(top: 120.h, bottom: 40.h),
          child: Image.asset(
            "assets/images/purchase.png",
            scale: 1,
          )),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        alignment: Alignment.center,
        child: reusableText("Order Successful!",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            fontSize: 28),
      ),
      Container(
        child: reusableText("You have successfully made order",
            fontColor: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
            fontSize: 15),
      )
    ],
  );
}

failurePaymentWidget(bool isDarkMode) {
  return Column(
    children: [
      Container(
          margin: EdgeInsets.only(top: 120.h, bottom: 40.h),
          child: Image.asset(
            "assets/images/purchase.png",
            scale: 0.8,
          )),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        alignment: Alignment.center,
        child: reusableText("Order Failed!",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            fontSize: 28),
      ),
      Container(
        child: reusableText("Error has occured",
            fontColor: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
            fontSize: 15),
      )
    ],
  );
}

selectShippingAddressWidget(bool isDarkMode, ShippingState state) {
  return Expanded(
    child: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  context
                      .read<ShippingBloc>()
                      .add(ChangeShippingIndexEvent(index));
                },
                child: shippingForm(
                    index, isDarkMode, index == state.index ? true : false),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    ),
  );
}

applyCheckoutButtonWidget(bool isDarkMode, BuildContext context) {
  return Container(
    width: 260.w,
    margin: EdgeInsets.only(bottom: 40.h, top: 20.h),
    child: reusableButtonCart("Apply", () {
      context.pop();
    }, isDarkMode, false),
  );
}

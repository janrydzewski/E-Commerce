import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/repositories/repositories.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class CartListItem extends StatefulWidget {
  final ProductCartModel productCartModel;
  final bool isCartItem;
  final bool isCheckout;

  const CartListItem(
      {super.key,
      required this.productCartModel,
      required this.isCartItem,
      required this.isCheckout});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  late CartItemBloc cartItemBloc;

  @override
  void initState() {
    cartItemBloc = CartItemBloc(
        cartRepository: RepositoryProvider.of<CartRepository>(context));
    cartItemBloc.add(GetCartProductDetailsEvent(
        firebaseAuth.currentUser!.uid, widget.productCartModel.id));

    super.initState();
  }

  @override
  void dispose() {
    cartItemBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocBuilder<CartItemBloc, CartItemState>(
      bloc: cartItemBloc,
      builder: (context, state) {
        final quantity = state.quantity;
        final currentPrice = int.parse(widget.productCartModel.price);
        return Container(
          width: 375.w,
          height: 120.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarkMode
                ? ColorProvider.sixthElementDark
                : ColorProvider.sixthElementLight,
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                width: 120.w,
                height: 120.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 90.w,
                      height: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isDarkMode
                            ? ColorProvider.fifthElementDark
                            : ColorProvider.fifthElementLight,
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      height: 50.w,
                      child: Image.network(widget.productCartModel.photoUrl),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 20.h, left: widget.isCartItem ? 0 : 10.w),
                width: 200.w,
                height: 120.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        reusableText(widget.productCartModel.name,
                            fontSize: widget.isCartItem ? 15 : 17,
                            fontColor: isDarkMode
                                ? ColorProvider.mainTextDark
                                : ColorProvider.mainTextLight),
                        widget.isCartItem
                            ? GestureDetector(
                                onTap: () {
                                  if (widget.isCartItem) {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 300.h,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 150.w,
                                                      right: 150.w,
                                                      bottom: 5.h),
                                                  child: const Divider(
                                                    thickness: 2,
                                                  ),
                                                ),
                                                reusableText(
                                                    "Remove From Cart?",
                                                    fontColor: isDarkMode
                                                        ? ColorProvider
                                                            .mainTextDark
                                                        : ColorProvider
                                                            .mainTextLight,
                                                    fontSize: 20),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 25.w,
                                                      right: 25.w,
                                                      top: 5.h),
                                                  child: Divider(
                                                    thickness: 0.3,
                                                    color: isDarkMode
                                                        ? ColorProvider
                                                            .thirdTextDark
                                                        : ColorProvider
                                                            .thirdTextLight,
                                                  ),
                                                ),
                                                CartListItem(
                                                  productCartModel:
                                                      widget.productCartModel,
                                                  isCartItem: false,
                                                  isCheckout: false,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 25.w),
                                                  child: Divider(
                                                    thickness: 0.3,
                                                    color: isDarkMode
                                                        ? ColorProvider
                                                            .thirdTextDark
                                                        : ColorProvider
                                                            .thirdTextLight,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      reusableButtonCartDelete(
                                                          "Cancel", () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      }, false, isDarkMode),
                                                      reusableButtonCartDelete(
                                                          "Yes, Remove", () {
                                                        context.read<CartBloc>().add(
                                                            DeleteProductFromCartEvent(
                                                                firebaseAuth
                                                                    .currentUser!
                                                                    .uid,
                                                                widget
                                                                    .productCartModel
                                                                    .id));
                                                        context.read<CartBloc>().add(
                                                            GetCartProductsEvent(
                                                                firebaseAuth
                                                                    .currentUser!
                                                                    .uid));
                                                        Navigator.of(context)
                                                            .pop();
                                                      }, true, isDarkMode),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  } else {
                                    context.read<CartBloc>().add(
                                        DeleteProductFromCartEvent(
                                            firebaseAuth.currentUser!.uid,
                                            widget.productCartModel.id));
                                    context.read<CartBloc>().add(
                                        GetCartProductsEvent(
                                            firebaseAuth.currentUser!.uid));
                                  }
                                },
                                child: Icon(
                                  Icons.delete_outline_outlined,
                                  color: isDarkMode
                                      ? ColorProvider.secondaryElementDark
                                      : ColorProvider.secondaryElementLight,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      child: reusableText(widget.productCartModel.name,
                          fontSize: widget.isCartItem ? 12 : 14,
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight),
                    ),
                    widget.isCartItem
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              reusableText("\$ ${(quantity) * currentPrice}.00",
                                  fontSize: 15,
                                  fontColor: isDarkMode
                                      ? ColorProvider.mainTextDark
                                      : ColorProvider.mainTextLight,
                                  fontWeight: FontWeight.w600),
                              Container(
                                width: 80.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: isDarkMode
                                      ? ColorProvider.fifthElementDark
                                      : ColorProvider.fifthElementLight,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        cartItemBloc.add(
                                            DecreaseQuantityInCartEvent(
                                                id: widget.productCartModel.id,
                                                quantity: quantity,
                                                finalPrice: currentPrice *
                                                    (quantity - 1)));
                                        context.read<CartBloc>().add(
                                            GetCartProductsEvent(
                                                firebaseAuth.currentUser!.uid));
                                      },
                                      child: reusableText("-",
                                          fontColor:
                                              ColorProvider.mainTextLight,
                                          fontSize: 15),
                                    ),
                                    reusableText("${quantity}",
                                        fontColor: isDarkMode
                                            ? ColorProvider.mainTextDark
                                            : ColorProvider.mainTextLight,
                                        fontSize: 15),
                                    GestureDetector(
                                      onTap: () {
                                        cartItemBloc.add(
                                            IncreaseQuantityInCartEvent(
                                                id: widget.productCartModel.id,
                                                quantity: quantity,
                                                finalPrice: currentPrice *
                                                    (quantity + 1)));
                                        context.read<CartBloc>().add(
                                            GetCartProductsEvent(
                                                firebaseAuth.currentUser!.uid));
                                      },
                                      child: reusableText("+",
                                          fontColor: isDarkMode
                                              ? ColorProvider.mainTextDark
                                              : ColorProvider.mainTextLight,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : widget.isCheckout
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  reusableText(
                                      "\$ ${(quantity) * currentPrice}.00",
                                      fontSize: 15,
                                      fontColor: isDarkMode
                                          ? ColorProvider.mainTextDark
                                          : ColorProvider.mainTextLight,
                                      fontWeight: FontWeight.w600),
                                  Container(
                                    width: 30.w,
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(
                                        color: isDarkMode
                                            ? ColorProvider.thirdElementDark
                                            : ColorProvider.thirdElementLight,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: reusableText("${quantity}",
                                        fontSize: 17),
                                  )
                                ],
                              )
                            : reusableText("\$ ${(quantity) * currentPrice}.00",
                                fontSize: 16,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight,
                                fontWeight: FontWeight.w600),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

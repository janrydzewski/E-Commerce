import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/bloc/bloc.dart';

mainElement(bool isDarkMode, bool isSelected, String text) {
  return Container(
    width: 167.w,
    height: 60.h,
    child: Column(
      children: [
        Expanded(
          child: reusableText(text,
              fontSize: 14.sp,
              fontColor: isDarkMode
                  ? isSelected
                      ? ColorProvider.mainTextDark
                      : ColorProvider.thirdTextDark
                  : isSelected
                      ? ColorProvider.mainTextLight
                      : ColorProvider.thirdTextLight),
        ),
        Divider(
            color: isDarkMode
                ? isSelected
                    ? ColorProvider.mainTextDark
                    : ColorProvider.thirdTextDark
                : isSelected
                    ? ColorProvider.mainTextLight
                    : ColorProvider.thirdTextLight,
            thickness: 2),
      ],
    ),
  );
}

class OrderListItem extends StatefulWidget {
  final ProductOrderModel productOrderModel;
  final bool isOngoing;

  const OrderListItem(
      {super.key, required this.productOrderModel, required this.isOngoing});

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return Container(
      width: 375.w,
      height: 140.h,
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
                  child: Image.network(widget.productOrderModel.photoUrl),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 200.w,
            height: 120.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText(widget.productOrderModel.name,
                    fontSize: 17,
                    fontColor: isDarkMode
                        ? ColorProvider.mainTextDark
                        : ColorProvider.mainTextLight),
                widget.productOrderModel.category == "Clothes" ||
                        widget.productOrderModel.category == "Shoes"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: reusableText(
                                "Color = ${widget.productOrderModel.color}",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                          Container(
                            child: reusableText("  |  ",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                          Container(
                            child: reusableText(
                                "Size = ${widget.productOrderModel.size}",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                          Container(
                            child: reusableText("  |  ",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                          Container(
                            child: reusableText(
                                "Qty = ${widget.productOrderModel.quantity}",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: reusableText(
                                "Color = ${widget.productOrderModel.color}",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                          Container(
                            child: reusableText("  |  ",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                          Container(
                            child: reusableText(
                                "Qty = ${widget.productOrderModel.quantity}",
                                fontSize: 10,
                                fontColor: isDarkMode
                                    ? ColorProvider.mainTextDark
                                    : ColorProvider.mainTextLight),
                          ),
                        ],
                      ),
                Container(
                  margin: EdgeInsets.only(top: 8.h, bottom: 5.h),
                  width: 80.w,
                  height: 20.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDarkMode
                        ? ColorProvider.fifthElementDark
                        : ColorProvider.fifthElementLight,
                  ),
                  child: reusableText(
                      widget.productOrderModel.type == "ongoing"
                          ? "In Delivery"
                          : "Completed",
                      fontSize: 9,
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableText("\$ ${widget.productOrderModel.finalPrice}.00",
                        fontSize: 16,
                        fontColor: isDarkMode
                            ? ColorProvider.mainTextDark
                            : ColorProvider.mainTextLight,
                        fontWeight: FontWeight.w600),
                    GestureDetector(
                      onTap: () {
                        print(widget.productOrderModel.type == "ongoing"
                            ? "Track Order"
                            : "Leave Review");
                      },
                      child: Container(
                        width: 90.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: isDarkMode
                              ? ColorProvider.fifthElementDark
                              : ColorProvider.fifthElementLight,
                        ),
                        child: reusableText(
                            widget.productOrderModel.type == "ongoing"
                                ? "Track Order"
                                : "Leave Review",
                            fontSize: 10,
                            fontColor: isDarkMode
                                ? ColorProvider.mainTextDark
                                : ColorProvider.mainTextLight,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

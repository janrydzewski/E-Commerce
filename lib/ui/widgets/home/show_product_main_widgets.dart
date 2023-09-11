import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mainProductImageWidget(bool isDarkMode, String photoUrl) {
  return SizedBox(
    width: 375.w,
    height: 300.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: isDarkMode
              ? ColorProvider.fifthElementDark
              : ColorProvider.fifthElementLight,
        ),
        Image.network(
          photoUrl,
          scale: 1.5,
        ),
      ],
    ),
  );
}

mainProductTextWidget(bool isDarkMode, String name) {
  return Container(
    height: 40.h,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
    child: reusableText(name,
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontWeight: FontWeight.w600),
  );
}

mainProductInfo(bool isDarkMode, String soldCounter, String opinion) {
  return Container(
    width: 375.w,
    height: 20.h,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(left: 15.w, top: 5.h),
    child: Row(
      children: [
        Container(
            height: 20.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isDarkMode
                  ? ColorProvider.fifthElementDark
                  : ColorProvider.fifthElementLight,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 2.h),
              child: reusableText("${soldCounter} sold",
                  fontColor: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight,
                  fontSize: 9.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600),
            )),
        Container(
            height: 20.h,
            margin: EdgeInsets.only(left: 15.w),
            width: 160.w,
            child: Row(
              children: [
                const Icon(Icons.star_half_outlined),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: reusableText("${opinion} ( 5.387 reviews )",
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                      fontSize: 12.sp,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
      ],
    ),
  );
}

homeDivider() {
  return Container(
    margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
    child: const Divider(
      thickness: 1,
    ),
  );
}

mainDescription(bool isDarkMode, String description) {
  return Container(
    height: 25.h,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(left: 15.w),
    child: reusableText(description,
        fontColor: isDarkMode
            ? ColorProvider.mainTextDark
            : ColorProvider.mainTextLight,
        fontWeight: FontWeight.w600,
        fontSize: 16),
  );
}

mainPriceWidget(ShowProductBloc showProductBloc, String price, String type,
    String description, bool isDarkMode, ProductModel productModel) {
  return BlocBuilder<ShowProductBloc, ShowProductState>(
    bloc: showProductBloc,
    builder: (context, state) {
      final sizeIndex = state.sizeIndex;
      final colorIndex = state.colorIndex;
      final quantity = state.quantity;
      final currentPrice = int.parse(price);
      return Column(
        children: [
          type == "Clothes"
              ? Column(
                  children: [
                    Container(
                      height: 60.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 15.w),
                      child: reusableTextMaxLines(description,
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight,
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.h),
                      height: 80.h,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 130.w,
                                alignment: Alignment.centerLeft,
                                child: reusableText("Size",
                                    fontColor: isDarkMode
                                        ? ColorProvider.mainTextDark
                                        : ColorProvider.mainTextLight,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                width: 150.w,
                                height: 30.h,
                                child: ListView.builder(
                                    itemCount: 3,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            print("Selected size: ${index}");
                                            showProductBloc.add(ChangeSizeEvent(
                                                sizeIndex: index));
                                          },
                                          child: sizeLetterListViewItem(
                                              index,
                                              index == sizeIndex
                                                  ? true
                                                  : false));
                                    }),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 180.w,
                                alignment: Alignment.centerLeft,
                                child: reusableText("Color",
                                    fontColor: isDarkMode
                                        ? ColorProvider.mainTextDark
                                        : ColorProvider.mainTextLight,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                width: 200.w,
                                height: 30.h,
                                child: ListView.builder(
                                    itemCount: 4,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            print("Selected size: ${index}");
                                            showProductBloc.add(
                                                ChangeColorEvent(
                                                    colorIndex: index));
                                          },
                                          child: sizeColorListViewItem(
                                              index,
                                              index == colorIndex
                                                  ? true
                                                  : false));
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : type == "Shoes"
                  ? Column(
                      children: [
                        Container(
                          height: 60.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 15.w),
                          child: reusableTextMaxLines(description,
                              fontColor: isDarkMode
                                  ? ColorProvider.mainTextDark
                                  : ColorProvider.mainTextLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.h),
                          height: 80.h,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 130.w,
                                    alignment: Alignment.centerLeft,
                                    child: reusableText("Size",
                                        fontColor: isDarkMode
                                            ? ColorProvider.mainTextDark
                                            : ColorProvider.mainTextLight,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.w),
                                    width: 150.w,
                                    height: 30.h,
                                    child: ListView.builder(
                                        itemCount: 3,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                print(
                                                    "Selected size: ${index}");
                                                showProductBloc.add(
                                                    ChangeSizeEvent(
                                                        sizeIndex: index));
                                              },
                                              child: sizeNumberListViewItem(
                                                  index,
                                                  index == sizeIndex
                                                      ? true
                                                      : false));
                                        }),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 180.w,
                                    alignment: Alignment.centerLeft,
                                    child: reusableText("Color",
                                        fontColor: isDarkMode
                                            ? ColorProvider.mainTextDark
                                            : ColorProvider.mainTextLight,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: 200.w,
                                    height: 30.h,
                                    child: ListView.builder(
                                        itemCount: 4,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                print(
                                                    "Selected size: ${index}");
                                                showProductBloc.add(
                                                    ChangeColorEvent(
                                                        colorIndex: index));
                                              },
                                              child: sizeColorListViewItem(
                                                  index,
                                                  index == colorIndex
                                                      ? true
                                                      : false));
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : type == "Bags" ||
                          type == "Watch" ||
                          type == "Toys" ||
                          type == "Electronics"
                      ? Column(
                          children: [
                            Container(
                              height: 60.h,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15.w),
                              child: reusableTextMaxLines(description,
                                  fontColor: isDarkMode
                                      ? ColorProvider.mainTextDark
                                      : ColorProvider.mainTextLight,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.h),
                              height: 80.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 345.w,
                                    alignment: Alignment.centerLeft,
                                    child: reusableText("Color",
                                        fontColor: isDarkMode
                                            ? ColorProvider.mainTextDark
                                            : ColorProvider.mainTextLight,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: 365.w,
                                    height: 30.h,
                                    child: ListView.builder(
                                        itemCount: 4,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                print(
                                                    "Selected size: ${index}");
                                                showProductBloc.add(
                                                    ChangeColorEvent(
                                                        colorIndex: index));
                                              },
                                              child: sizeColorListViewItem(
                                                  index,
                                                  index == colorIndex
                                                      ? true
                                                      : false));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: 140.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 15.w),
                          child: reusableText(description,
                              fontColor: isDarkMode
                                  ? ColorProvider.mainTextDark
                                  : ColorProvider.mainTextLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
          Container(
            height: 50.h,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 5.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: reusableText("Quantity",
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Container(
                  width: 110.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDarkMode
                        ? ColorProvider.fifthElementDark
                        : ColorProvider.fifthElementLight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("-");
                          showProductBloc.add(DecreaseQuantityEvent(
                              quantity: quantity, price: currentPrice));
                        },
                        child: reusableText("-",
                            fontColor: isDarkMode
                                ? ColorProvider.mainTextDark
                                : ColorProvider.mainTextLight,
                            fontSize: 20),
                      ),
                      reusableText("${quantity}",
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight,
                          fontSize: 18),
                      GestureDetector(
                        onTap: () {
                          print("+");
                          showProductBloc.add(IncreaseQuantityEvent(
                              quantity: quantity, price: currentPrice));
                        },
                        child: reusableText("+",
                            fontColor: isDarkMode
                                ? ColorProvider.mainTextDark
                                : ColorProvider.mainTextLight,
                            fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Container(
            height: 50.h,
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      child: reusableText("\$ ${state.finalPrice}.00",
                          fontColor: isDarkMode
                              ? ColorProvider.mainTextDark
                              : ColorProvider.mainTextLight,
                          fontWeight: FontWeight.w600,
                          fontSize: 19),
                    ),
                  ],
                ),
                reusableButtonProduct("Add to Cart", () {
                  String size = "";
                  String color = "";

                  if (type == "Clothes") {
                    size = getSize("Clothes", sizeIndex);
                    color = getColor(colorIndex);
                  } else if (type == "Shoes") {
                    size = getSize("Shoes", sizeIndex);
                    color = getColor(colorIndex);
                  } else if (type == "Bags" ||
                      type == "Electronics" ||
                      type == "Watch" ||
                      type == "Toys") {
                    color = getColor(colorIndex);
                  }

                  if (state.quantity > 0) {
                    context.read<ProductBloc>().add(AddProductToCartEvent(
                        ProductCartModel(
                            id: productModel.id,
                            name: productModel.name,
                            price: productModel.price,
                            photoUrl: productModel.photoUrl,
                            size: size,
                            color: color,
                            category: productModel.category,
                            quantity: state.quantity.toString(),
                            finalPrice:
                                (state.quantity * int.parse(productModel.price))
                                    .toString()),
                        firebaseAuth.currentUser!.uid));
                  }
                }, isDarkMode),
              ],
            ),
          ),
        ],
      );
    },
  );
}

String getSize(String type, int index) {
  String size = "";

  if (type == "Clothes") {
    switch (index) {
      case 0:
        size = "S";
        break;
      case 1:
        size = "M";
        break;
      case 2:
        size = "L";
        break;
    }
    return size;
  } else {
    switch (index) {
      case 0:
        size = "36";
        break;
      case 1:
        size = "37";
        break;
      case 2:
        size = "38";
        break;
      case 3:
        size = "39";
        break;
      case 4:
        size = "40";
        break;
      case 5:
        size = "41";
        break;
      case 6:
        size = "42";
        break;
      case 7:
        size = "43";
        break;
      case 8:
        size = "44";
        break;
    }
    return size;
  }
}

String getColor(int index) {
  String color = "";

  switch (index) {
    case 0:
      color = "blueGrey";
    case 1:
      color = "brown";
    case 2:
      color = "grey";
    case 3:
      color = "black87";
  }
  return color;
}

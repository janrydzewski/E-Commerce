import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

mainCategoryProductWidget(
    List<ProductModel> productList, BuildContext context, bool isDarkMode) {
  return Container(
    width: 375.w,
    margin: EdgeInsets.only(top: 30.h),
    child: GridView.builder(
      itemCount: productList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            print("Selected: ${productList[index].name}");
            context.go('/home/show_product', extra: productList[index]);
          },
          child: reusableProductItem(productList[index], isDarkMode),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 2.5),
    ),
  );
}

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

mainHomeTopBar(bool isDarkMode) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      if (state.userStatus == UserStatus.loading) {
        return const Loading();
      } else if (state.userStatus == UserStatus.loaded) {
        UserModel? userModel = context.read<UserBloc>().state.userModel;
        return homeTopBar(isDarkMode, userModel!);
      }
      return Container();
    },
  );
}

homeTopBar(bool isDarkMode, UserModel userModel) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: isDarkMode
                        ? ColorProvider.mainElementDark
                        : ColorProvider.mainElementLight,
                  ),
                  image: userModel!.profilePhoto.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(userModel.profilePhoto),
                          fit: BoxFit.cover)
                      : null,
                  shape: BoxShape.circle),
              child: userModel.profilePhoto.isEmpty
                  ? Icon(
                      Icons.person_rounded,
                      color: isDarkMode
                          ? ColorProvider.secondaryElementDark
                          : ColorProvider.secondaryElementLight,
                    )
                  : null,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Good Morning",
                      fontColor: ColorProvider.fourthElementLight,
                      fontSize: 13),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableText(userModel.fullName,
                      fontColor: isDarkMode
                          ? ColorProvider.mainTextDark
                          : ColorProvider.mainTextLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.notifications_outlined,
              color: isDarkMode
                  ? ColorProvider.mainElementDark
                  : ColorProvider.mainElementLight,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Icon(Icons.favorite_border_outlined,
                  color: isDarkMode
                      ? ColorProvider.mainElementDark
                      : ColorProvider.mainElementLight),
            ),
          ],
        ),
      ],
    ),
  );
}

specialOfferWidget(bool isDarkMode, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        reusableText("Special Offers",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        GestureDetector(
          onTap: () {
            context.go('/home/special_offers');
            print("Selected: See All");
          },
          child: reusableText("See All",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

specialOfferSliderWidget(
    bool isDarkMode, int pageViewIndex, BuildContext context) {
  return Container(
    width: 375.w,
    height: 170.h,
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    decoration: BoxDecoration(
      color: isDarkMode
          ? ColorProvider.fifthElementDark
          : ColorProvider.fifthElementLight,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            print("Selected: ${pageViewIndex}");
          },
          child: PageView(
            onPageChanged: (value) {
              pageViewIndex = value;
              context
                  .read<HomeBloc>()
                  .add(ChangePageViewEvent(newIndex: pageViewIndex));
            },
            children: pageViewItemsList(isDarkMode),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          left: 0,
          child: DotsIndicator(
            dotsCount: 4,
            decorator: DotsDecorator(
              activeColor: isDarkMode
                  ? ColorProvider.secondaryElementDark
                  : ColorProvider.secondaryElementLight,
              color: isDarkMode
                  ? ColorProvider.fourthElementDark
                  : ColorProvider.fourthElementLight,
              size: const Size(6, 6),
              activeSize: const Size(6, 6),
            ),
            position: pageViewIndex,
          ),
        ),
      ],
    ),
  );
}

categoryWrapWidget(bool isDarkMode, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 25.h),
    child: Wrap(
      children: [
        Container(
          child: categoryButton("Clothes", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Shoes", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Bags", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Electronics", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Watch", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Jewelry", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Kitchen", isDarkMode, context),
        ),
        Container(
          child: categoryButton("Toys", isDarkMode, context),
        ),
      ],
    ),
  );
}

mostPopularWidget(bool isDarkMode) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        reusableText("Most Popular",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        GestureDetector(
          onTap: () {
            print("Selected: See All");
          },
          child: reusableText("See All",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

showProductHomeWidget(int categoryIndex, bool isDarkMode) {
  return BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
      List<ProductModel> productList = state.productList;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            width: 375.w,
            height: 30.h,
            child: ListView.builder(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        String text = "";
                        switch (index) {
                          case 0:
                            text = "";
                            break;
                          case 1:
                            text = "Clothes";
                            break;
                          case 2:
                            text = "Shoes";
                            break;
                          case 3:
                            text = "Bags";
                            break;
                          case 4:
                            text = "Electronics";
                            break;
                          case 5:
                            text = "Watch";
                            break;
                          case 6:
                            text = "Jewelry";
                            break;
                          case 7:
                            text = "Kitchen";
                            break;
                          case 8:
                            text = "Toys";
                            break;
                        }
                        print("Selected category: ${text}");
                        context
                            .read<HomeBloc>()
                            .add(ChangeCategoryEvent(newIndex: index));

                        context.read<ProductBloc>().add(GetProductsEvent(text));
                      },
                      child: categoryListViewItem(index,
                          categoryIndex == index ? true : false, isDarkMode));
                }),
          ),
          Container(
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
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/ui/views/views.dart';
import 'package:ecommerce/resources/resources.dart';

getPage(int index) {
  List pages = [
    const Home(),
    const Cart(),
    const Orders(),
    const Wallet(),
    const Profile(),
  ];
  return pages[index];
}

List<BottomNavigationBarItem> bottomNavigationBarItemsList(bool isDarkMode) {
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.home_filled,
            color: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
          )),
      activeIcon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.home_filled,
            color: isDarkMode
                ? ColorProvider.secondaryElementDark
                : ColorProvider.secondaryElementLight,
          )),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
          )),
      activeIcon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: isDarkMode
                ? ColorProvider.secondaryElementDark
                : ColorProvider.secondaryElementLight,
          )),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
          )),
      activeIcon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.shopping_cart_outlined,
            color: isDarkMode
                ? ColorProvider.secondaryElementDark
                : ColorProvider.secondaryElementLight,
          )),
      label: "Orders",
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.account_balance_wallet_outlined,
            color: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
          )),
      activeIcon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.account_balance_wallet_outlined,
            color: isDarkMode
                ? ColorProvider.secondaryElementDark
                : ColorProvider.secondaryElementLight,
          )),
      label: "Wallet",
    ),
    BottomNavigationBarItem(
      icon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.person_outline,
            color: isDarkMode
                ? ColorProvider.fourthElementDark
                : ColorProvider.fourthElementLight,
          )),
      activeIcon: SizedBox(
          width: 40.w,
          child: Icon(
            Icons.person_outline,
            color: isDarkMode
                ? ColorProvider.secondaryElementDark
                : ColorProvider.secondaryElementLight,
          )),
      label: "Profile",
    ),
  ];
  return bottomNavigationBarItems;
}

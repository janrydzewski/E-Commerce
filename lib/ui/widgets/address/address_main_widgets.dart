import 'dart:async';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/cart/cart.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

selectAddressWidget(List<AddressModel> addressList, bool isDarkMode,
    AddressState state, BuildContext context) {
  return Expanded(
    child: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<AddressBloc>().add(ChangeIndexEvent(index));
                },
                child: addressForm(addressList[index], isDarkMode,
                    index == state.index ? true : false),
              );
            },
            childCount: addressList.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: 300.w,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: reusableButtonAddress("Add New Address", () {
              context.push('/profile/select_address/add_address');
            }, isDarkMode),
          ),
        ),
      ],
    ),
  );
}

applyButtonWidget(bool isDarkMode, BuildContext context) {
  return Container(
    width: 260.w,
    margin: EdgeInsets.only(bottom: 40.h, top: 20.h),
    child: reusableButtonCart("Apply", () {
      context.pop();
    }, isDarkMode, false),
  );
}

mapWidget(
    AddAddressState state,
    CameraPosition currentPosition,
    bool isDarkMode,
    String _darkMapStyle,
    String _lightMapStyle,
    Completer<GoogleMapController> _controller) {
  return Expanded(
    child: Container(
      width: 375.w,
      child: GoogleMap(
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        markers: state.markers,
        initialCameraPosition: currentPosition,
        onMapCreated: (controllerMap) {
          if (isDarkMode) {
            controllerMap.setMapStyle(_darkMapStyle);
          } else {
            controllerMap.setMapStyle(_lightMapStyle);
          }
          if (!_controller.isCompleted) {
            _controller.complete(controllerMap);
          }
        },
      ),
    ),
  );
}

mapDetailsWidget(
    bool isDarkMode,
    TextEditingController _nameController,
    TextEditingController _addressController,
    AddAddressBloc addressBloc,
    AddAddressState state,
    BuildContext context) {
  return Container(
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      color: isDarkMode
          ? ColorProvider.backgroundDark
          : ColorProvider.backgroundLight,
    ),
    width: 375.w,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 150.w, right: 150.w, bottom: 5.h),
          child: const Divider(
            thickness: 2,
          ),
        ),
        reusableText("Address Details",
            fontColor: isDarkMode
                ? ColorProvider.mainTextDark
                : ColorProvider.mainTextLight,
            fontSize: 20),
        Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
          child: Divider(
            thickness: 0.3,
            color: isDarkMode
                ? ColorProvider.thirdTextDark
                : ColorProvider.thirdTextLight,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
          alignment: Alignment.centerLeft,
          child: reusableText("Name Address",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        reusableTextFieldAddress(_nameController, isDarkMode, false, () {}),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
          alignment: Alignment.centerLeft,
          child: reusableText("Address Details",
              fontColor: isDarkMode
                  ? ColorProvider.mainTextDark
                  : ColorProvider.mainTextLight,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        reusableTextFieldAddress(_addressController, isDarkMode, true, () {
          addressBloc.add(const GetUserLocationEvent());
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            reusableButtonAddAddress("Check", () {
              addressBloc.add(SearchUserEvent(_addressController.text));
            }, isDarkMode),
            reusableButtonAddAddress("Add", () {
              addressBloc.add(AddUserAddressEvent(
                  _nameController.text,
                  state.type
                      ? _addressController.text
                      : "${state.address[0].street!} ${state.address[0].locality!}, ${state.address[0].country!}",
                  state.latitude,
                  state.longitude));
              context.pop();
            }, isDarkMode),
          ],
        )
      ],
    ),
  );
}

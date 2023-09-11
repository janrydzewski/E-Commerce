import 'dart:async';

import 'package:ecommerce/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  late AddAddressBloc addressBloc;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  late String _darkMapStyle;
  late String _lightMapStyle;

  @override
  void initState() {
    addressBloc = AddAddressBloc(
        addressRepository: RepositoryProvider.of<AddressRepository>(context));
    _nameController.clear();
    _addressController.clear();
    super.initState();
    _loadMapStyles();
  }

  @override
  void dispose() {
    _nameController.clear();
    _addressController.clear();
    super.dispose();
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/maps/dark_mode.json');
    _lightMapStyle = await rootBundle.loadString('assets/maps/light_mode.json');
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;

    return Container(
      width: 375.w,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ColorProvider.backgroundDark
            : ColorProvider.backgroundLight,
        appBar: buildAppBar("Add New Address", isDarkMode),
        body: SafeArea(
          child: BlocConsumer<AddAddressBloc, AddAddressState>(
            bloc: addressBloc,
            listener: (context, state) {
              if (state is AddAddressError) {
                snackBarError(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is AddressLoading) {
                return const Loading();
              }

              final currentPosition = CameraPosition(
                target: LatLng(state.latitude, state.longitude),
                zoom: state.zoom,
              );
              if (!state.type) {
                if (state.address.isNotEmpty) {
                  final myAddress = state.address[0];
                  _nameController.text = myAddress.name!;
                  _addressController.text =
                      "${myAddress.street!} ${myAddress.locality!}, ${myAddress.country!}";
                } else {
                  _nameController.text = "Input Name";
                  _addressController.text = "Street, City, Country";
                }
              }

              return Column(
                children: [
                  mapWidget(state, currentPosition, isDarkMode, _darkMapStyle,
                      _lightMapStyle, _controller),
                  mapDetailsWidget(isDarkMode, _nameController,
                      _addressController, addressBloc, state, context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

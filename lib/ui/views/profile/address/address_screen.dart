import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    context.read<AddressBloc>().add(const GetAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocConsumer<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state is AddressError) {
          snackBarError(context, state.message);
        }
      },
      builder: (context, state) {
        if (!state.isLoaded) {
          return const Loading();
        }
        final addressList = state.addressList;
        return SizedBox(
          width: 375.w,
          child: Scaffold(
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            appBar: buildAppBar("Shipping Address", isDarkMode),
            body: SafeArea(
              child: Column(
                children: [
                  selectAddressWidget(addressList, isDarkMode, state, context),
                  applyButtonWidget(isDarkMode, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  void initState() {
    context.read<EditProductAdminBloc>().add(const GetProductAdminEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocConsumer<EditProductAdminBloc, EditProductAdminState>(
      listener: (context, state) {
        if (state is EditProductError) {
          snackBarError(context, state.message);
        }
      },
      builder: (context, state) {
        if (!state.isLoaded) {
          return const Loading();
        }
        final productList = state.productList;
        return Container(
          width: 375.w,
          child: Scaffold(
            appBar: buildAppBarAdmin("List of products", isDarkMode),
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            body: Container(
              child: mainListViewAdmin(productList, isDarkMode),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:ecommerce/data/models/models.dart';

class ShowProduct extends StatefulWidget {
  final ProductModel productModel;
  final String type;

  const ShowProduct(
      {super.key, required this.productModel, required this.type});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  late ShowProductBloc showProductBloc;

  @override
  void initState() {
    showProductBloc = ShowProductBloc();
    super.initState();
  }

  @override
  void dispose() {
    showProductBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Loading();
        }
        return SizedBox(
          width: 375.w,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: isDarkMode
                  ? ColorProvider.fifthElementDark
                  : ColorProvider.fifthElementLight,
              iconTheme: IconThemeData(
                  color: isDarkMode
                      ? ColorProvider.mainTextDark
                      : ColorProvider.mainTextLight),
            ),
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainProductImageWidget(
                      isDarkMode, widget.productModel.photoUrl),
                  mainProductTextWidget(isDarkMode, widget.productModel.name),
                  mainProductInfo(isDarkMode, widget.productModel.soldCounter,
                      widget.productModel.opinion),
                  homeDivider(),
                  mainDescription(isDarkMode, widget.productModel.description),
                  mainPriceWidget(
                      showProductBloc,
                      widget.productModel.price,
                      widget.type,
                      widget.productModel.description,
                      isDarkMode,
                      widget.productModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

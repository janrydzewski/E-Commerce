import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class CategoryProduct extends StatefulWidget {
  final String category;

  const CategoryProduct({super.key, required this.category});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductsCategoryEvent(widget.category));
    super.initState();
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
        final productList = context.read<ProductBloc>().state.productList;
        return SizedBox(
          width: 375.w,
          child: Scaffold(
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            appBar: buildAppBar(widget.category, isDarkMode),
            body: SafeArea(
              child:
                  mainCategoryProductWidget(productList, context, isDarkMode),
            ),
          ),
        );
      },
    );
  }
}

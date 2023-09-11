import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<ProductBloc>().add(const GetProductsEvent(""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var pageViewIndex = state.pageViewIndex;
        var categoryIndex = state.categoryIndex;
        return BlocBuilder<ThemeCubit, Brightness>(
          builder: (context, state) {
            final isDarkMode = state == Brightness.dark;
            return Scaffold(
              backgroundColor: isDarkMode
                  ? ColorProvider.backgroundDark
                  : ColorProvider.backgroundLight,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      mainHomeTopBar(isDarkMode),
                      searchField(searchController, isDarkMode),
                      specialOfferWidget(isDarkMode, context),
                      specialOfferSliderWidget(
                          isDarkMode, pageViewIndex, context),
                      categoryWrapWidget(isDarkMode, context),
                      mostPopularWidget(isDarkMode),
                      showProductHomeWidget(categoryIndex, isDarkMode),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

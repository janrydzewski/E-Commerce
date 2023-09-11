import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode
          ? ColorProvider.backgroundDark
          : ColorProvider.backgroundLight,
      appBar: buildAppBar("Admin", isDarkMode),
      body: SingleChildScrollView(
        child: adminColumnWidget(context, isDarkMode),
      ),
    );
  }
}

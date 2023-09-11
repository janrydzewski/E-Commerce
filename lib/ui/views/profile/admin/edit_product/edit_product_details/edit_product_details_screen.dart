import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';

class EditProductDetails extends StatefulWidget {
  final ProductModel productModel;

  const EditProductDetails({super.key, required this.productModel});

  @override
  State<EditProductDetails> createState() => _EditProductDetailsState();
}

class _EditProductDetailsState extends State<EditProductDetails> {
  late EditProductDetailsAdminBloc adminBloc;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _opinionController = TextEditingController();
  final _soldCounterController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void initState() {
    adminBloc = EditProductDetailsAdminBloc(
        adminRepository: RepositoryProvider.of<AdminRepository>(context));
    _nameController.text = widget.productModel.name;
    _descriptionController.text = widget.productModel.description;
    _opinionController.text = widget.productModel.opinion;
    _soldCounterController.text = widget.productModel.soldCounter;
    _priceController.text = widget.productModel.price;
    _categoryController.text = widget.productModel.category;
    super.initState();
  }

  @override
  void dispose() {
    adminBloc.close();
    _nameController.dispose();
    _descriptionController.dispose();
    _opinionController.dispose();
    _soldCounterController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    dynamic pickedImage;

    return BlocBuilder<EditProductDetailsAdminBloc,
        EditProductDetailsAdminState>(
      bloc: adminBloc,
      builder: (context, state) {
        if (!state.isLoaded) {
          return const Loading();
        }

        return Scaffold(
          backgroundColor: isDarkMode
              ? ColorProvider.backgroundDark
              : ColorProvider.backgroundLight,
          appBar: buildAppBarAdmin("Edit Product", isDarkMode),
          body: SingleChildScrollView(
            child: Column(
              children: [
                editProductPhotoWidget(isDarkMode, pickedImage, picker,
                    adminBloc, state, widget.productModel),
                reusableTextFieldAdmin("Name", _nameController, isDarkMode),
                reusableTextFieldAdmin(
                    "Description", _descriptionController, isDarkMode),
                reusableTextFieldAdmin(
                    "Category", _categoryController, isDarkMode),
                reusableTextFieldAdmin("Price", _priceController, isDarkMode),
                reusableTextFieldAdmin(
                    "Opinion", _opinionController, isDarkMode),
                reusableTextFieldAdmin(
                    "Sold Counter", _soldCounterController, isDarkMode),
                editProductButton(
                  isDarkMode,
                  pickedImage,
                  _nameController,
                  _descriptionController,
                  _opinionController,
                  _soldCounterController,
                  _priceController,
                  _categoryController,
                  adminBloc,
                  context,
                  widget.productModel,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

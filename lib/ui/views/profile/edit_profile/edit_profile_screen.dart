import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:ecommerce/repositories/repositories.dart';
import 'package:ecommerce/data/models/models.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late EditProfileBloc editProfileBloc;

  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void initState() {
    editProfileBloc = EditProfileBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context));
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.clear();
    _userNameController.clear();
    _birthDateController.clear();
    _emailController.clear();
    _countryController.clear();
    _phoneNumberController.clear();
    _genderController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    dynamic pickedImage;
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    UserModel? userModel = context.read<UserBloc>().state.userModel;
    _fullNameController.text = userModel!.fullName;
    _userNameController.text = userModel.userName;
    _birthDateController.text = userModel.birthDate;
    _emailController.text = userModel.email;
    _countryController.text = userModel.country;
    _phoneNumberController.text = userModel.phoneNumber;
    _genderController.text = userModel.gender;
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      bloc: editProfileBloc,
      builder: (context, state) {
        return SizedBox(
          width: 375.w,
          child: Scaffold(
            backgroundColor: isDarkMode
                ? ColorProvider.backgroundDark
                : ColorProvider.backgroundLight,
            appBar: buildAppBar("Edit Profile", isDarkMode),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  editProfilePhotoWidget(pickedImage, picker, editProfileBloc,
                      context, isDarkMode, state, userModel),
                  reusableTextFieldAdmin(
                      "Full Name", _fullNameController, isDarkMode),
                  reusableTextFieldAdmin(
                      "User Name", _userNameController, isDarkMode),
                  reusableDatePicker(
                      "Birth Date", _birthDateController, context, isDarkMode),
                  reusableTextFieldAdmin("Email", _emailController, isDarkMode),
                  reusableTextFieldAdmin(
                      "Country", _countryController, isDarkMode),
                  reusableTextFieldAdmin(
                      "Phone Number", _phoneNumberController, isDarkMode),
                  reusableTextFieldAdmin(
                      "Gender", _genderController, isDarkMode),
                  updateProfileButton(
                      isDarkMode,
                      pickedImage,
                      _fullNameController,
                      _userNameController,
                      _birthDateController,
                      _emailController,
                      _phoneNumberController,
                      _genderController,
                      _countryController,
                      editProfileBloc,
                      context,
                      userModel)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

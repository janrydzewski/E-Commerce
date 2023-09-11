import 'dart:io';

import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/profile/profile.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

adminColumnWidget(BuildContext context, bool isDarkMode) {
  return Column(
    children: [
      reusableProfileTab(Icons.add_outlined, "Add Product", () {
        context.go('/profile/admin/add_product');
      }, isDarkMode),
      reusableProfileTab(Icons.edit_outlined, "Edit Product", () {
        context.go('/profile/admin/edit_product');
      }, isDarkMode),
    ],
  );
}

productImageWidget(bool isDarkMode, dynamic pickedImage, ImagePicker picker,
    AddProductAdminBloc adminBloc, AddProductAdminState state) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 25.h),
    child: GestureDetector(
      onTap: () async {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        adminBloc.add(AddPhotoEvent(pickedImage));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorProvider.mainElementLight,
                    ),
                    shape: BoxShape.circle),
                child: state.file.path != ""
                    ? SizedBox(
                        width: 80.w, child: Image.file(File(state.file.path)))
                    : Icon(
                        Icons.image,
                        color: ColorProvider.secondaryElementLight,
                        size: 80.w,
                      )),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isDarkMode
                      ? ColorProvider.secondaryElementDark
                      : ColorProvider.secondaryElementLight,
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit,
                      color: isDarkMode
                          ? ColorProvider.sixthElementDark
                          : ColorProvider.sixthElementLight,
                      size: 15.w,
                    ))),
          )
        ],
      ),
    ),
  );
}

addProductButton(
    bool isDarkMode,
    dynamic pickedImage,
    TextEditingController _nameController,
    TextEditingController _descriptionController,
    TextEditingController _opinionController,
    TextEditingController _soldCounterController,
    TextEditingController _priceController,
    TextEditingController _categoryController,
    AddProductAdminBloc adminBloc,
    BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 50.h),
    child: reusableButton("Add", () async {
      String downloadUrl = "";
      if (pickedImage != null) {
        File image = File(pickedImage.path);
        Reference storageRef =
            firebaseStorage.ref().child('uploads/profilePhotos/${image.path}');
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
      }
      ProductModel productModel = ProductModel(
          id: "",
          name: _nameController.text,
          description: _descriptionController.text,
          opinion: _opinionController.text,
          soldCounter: _soldCounterController.text,
          price: _priceController.text,
          photoUrl: downloadUrl == "" ? "" : downloadUrl,
          category: _categoryController.text);
      adminBloc.add(AddProductAdminEEvent(productModel));
      Navigator.of(context).pop();
    }, isDarkMode),
  );
}

mainListViewAdmin(List<ProductModel> productList, bool isDarkMode) {
  return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              context.go('/profile/admin/edit_product/edit_product_details',
                  extra: productList[index]);
            },
            child: editProductListItem(productList[index], isDarkMode));
      });
}

editProductPhotoWidget(
    bool isDarkMode,
    dynamic pickedImage,
    ImagePicker picker,
    EditProductDetailsAdminBloc adminBloc,
    EditProductDetailsAdminState state,
    ProductModel productModel) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 25.h),
    child: GestureDetector(
      onTap: () async {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        adminBloc.add(EditPhotoAdminDetailsEvent(pickedImage));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: isDarkMode
                          ? ColorProvider.mainElementDark
                          : ColorProvider.mainElementLight,
                    ),
                    shape: BoxShape.circle),
                child: state.file.path != ""
                    ? SizedBox(
                        width: 80.w, child: Image.file(File(state.file.path)))
                    : Image.network(productModel.photoUrl)),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isDarkMode
                      ? ColorProvider.secondaryElementDark
                      : ColorProvider.secondaryElementLight,
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit,
                      color: isDarkMode
                          ? ColorProvider.sixthElementDark
                          : ColorProvider.sixthElementLight,
                      size: 15.w,
                    ))),
          )
        ],
      ),
    ),
  );
}

editProductButton(
    bool isDarkMode,
    dynamic pickedImage,
    TextEditingController _nameController,
    TextEditingController _descriptionController,
    TextEditingController _opinionController,
    TextEditingController _soldCounterController,
    TextEditingController _priceController,
    TextEditingController _categoryController,
    EditProductDetailsAdminBloc adminBloc,
    BuildContext context,
    ProductModel product) {
  return Container(
    margin: EdgeInsets.only(top: 50.h),
    child: reusableButton("Edit", () async {
      String downloadUrl = "";
      if (pickedImage != null) {
        File image = File(pickedImage.path);
        Reference storageRef =
            firebaseStorage.ref().child('uploads/profilePhotos/${image.path}');
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
      }
      ProductModel productModel = ProductModel(
          id: product.id,
          name: _nameController.text,
          description: _descriptionController.text,
          opinion: _opinionController.text,
          soldCounter: _soldCounterController.text,
          price: _priceController.text,
          photoUrl: downloadUrl == "" ? product.photoUrl : downloadUrl,
          category: _categoryController.text);
      adminBloc.add(EditProductEvent(productModel));
      Navigator.of(context).pop();
    }, isDarkMode),
  );
}

editProfilePhotoWidget(
    dynamic pickedImage,
    ImagePicker picker,
    EditProfileBloc editProfileBloc,
    BuildContext context,
    bool isDarkMode,
    EditProfileState state,
    UserModel userModel) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 25.h),
    child: GestureDetector(
      onTap: () async {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        editProfileBloc.add(EditPhotoEvent(pickedImage));
        snackBarSuccess(context, "Photo has been successfully chosen.");
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: isDarkMode
                          ? ColorProvider.mainElementDark
                          : ColorProvider.mainElementLight,
                      width: 2,
                    ),
                    shape: BoxShape.circle),
                child: state.file.path != ""
                    ? ClipOval(
                        child: SizedBox(
                            width: 80.w,
                            child: Image.file(
                              File(state.file.path),
                              fit: BoxFit.cover,
                            )))
                    : ClipOval(
                        child: Image.network(userModel.profilePhoto,
                            fit: BoxFit.cover))),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isDarkMode
                      ? ColorProvider.secondaryElementDark
                      : ColorProvider.secondaryElementLight,
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit,
                      color: isDarkMode
                          ? ColorProvider.sixthElementDark
                          : ColorProvider.sixthElementLight,
                      size: 15.w,
                    ))),
          )
        ],
      ),
    ),
  );
}

updateProfileButton(
    bool isDarkMode,
    dynamic pickedImage,
    TextEditingController _fullNameController,
    TextEditingController _userNameController,
    TextEditingController _birthDateController,
    TextEditingController _emailController,
    TextEditingController _phoneNumberController,
    TextEditingController _genderController,
    TextEditingController _countryController,
    EditProfileBloc editProfileBloc,
    BuildContext context,
    UserModel userModel) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 40.h),
    child: reusableButton("Update", () async {
      String downloadUrl = "";
      if (pickedImage != null) {
        File image = File(pickedImage.path);
        Reference storageRef =
            firebaseStorage.ref().child('uploads/profilePhotos/${image.path}');
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
      }
      UserModel updatedUser = UserModel(
          id: userModel.id,
          fullName: _fullNameController.text,
          userName: _userNameController.text,
          birthDate: _birthDateController.text,
          email: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          gender: _genderController.text,
          profilePhoto:
              downloadUrl == "" ? userModel.profilePhoto : downloadUrl,
          country: _countryController.text);
      editProfileBloc.add(EditProfileDetailsEvent(updatedUser));
      snackBarSuccess(context, "Changes has been successfully updated.");
    }, isDarkMode),
  );
}

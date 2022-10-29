import 'dart:io';
import 'package:divine_mercy_app_the_right_way/firebase/firebase_methods.dart';
import 'package:divine_mercy_app_the_right_way/methods/app_permission.dart';
import 'package:divine_mercy_app_the_right_way/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../app/nav_bar.dart';
import '../main.dart';
import '../utils/app_utils.dart';

class LoginCtl extends GetxController {
  TextEditingController numberCtl = TextEditingController();
  TextEditingController otpsCtl = TextEditingController();
  TextEditingController nameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController marketNameCtl = TextEditingController();

  String code = '+234';
  RxString nameError = RxString('');

  RxString emailError = RxString('');
  RxString marketNameError = RxString('');

  RxString numberError = RxString('');
  RxString pinError = RxString('');
  RxBool isloading = RxBool(false);
  AppPermissions appPermissions = AppPermissions();
  var selectedImage = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  AppFireBase appFirebase = AppFireBase();
  late String number;

  @override
  void onClose() {
    numberCtl.dispose();
    otpsCtl.dispose();
    super.onClose();
  }

  void sendOtp() async {
    /// this would be connected like so {numberCtl + numberUI,otpsCtl + otpUI}
    if (numberCtl.text.isEmpty) {
      numberError('Field is reuried');
    } else if (numberCtl.text.length < 10) {
      numberError.value = 'Field is too short';
    } else {
      numberError.value = '';
      number = code + numberCtl.text;
      await AppFireBase().sendVerificationCode(number);
    }
  }

  void verifyOtp() async {
    if (otpsCtl.text.isEmpty) {
      pinError.value = 'Field is reuried';
    } else if (otpsCtl.text.length < 6) {
      pinError.value = 'invalid pin';
    } else {
      pinError.value = '';
      isloading = RxBool(true);
      await AppFireBase().verifyUser(otpsCtl.text);
      isloading = RxBool(false);
      Get.off(() => const ButtomNav(title: 'Buttom Nav'));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    switch (source) {
      case ImageSource.camera:
        File? file = await AppUtils().imageFromCamera(true);
        selectedImage.value = file!.path;
        break;
      case ImageSource.gallery:
        File? file = await AppUtils().imageFromGalery(true);
        selectedImage.value = file!.path;
        break;
      default:
    }
  }

  void skipInfo() {
    isloading.value = true;
    var userModel = UserModel(
        uId: auth.currentUser!.uid,
        name: '',
        image: '',
        number: number,
        status: 'Hey there, I\'m using DM App',
        typing: 'false',
        online: DateTime.now().toString(),
        marketName: marketNameCtl.text);
    appFirebase.createUser(userModel).then((userModel) => isloading(false));
    Get.offAllNamed(Routes.NAV_BAR);
  }

  void uploadUserData() async {
    if (nameCtl.text.isEmpty ||
        emailCtl.text.isEmpty ||
        marketNameCtl.text.isEmpty) {
      nameError('Field is required');
      emailError('Field is required');
      marketNameError('Field is required');
    } else if (selectedImage.value == '') {
      printError(info: 'Image is required');
    } else {
      nameError.value = '';
      emailError.value = '';
      marketNameError.value = '';
      isloading.value = true;
      String link = await appFirebase.uploadUserImage(
          'profile/image', auth.currentUser!.uid, File(selectedImage.value));

      var userModel = UserModel(
        uId: auth.currentUser!.uid,
        name: nameCtl.text,
        image: link,
        number: number,
        status: 'Hey there, I\'m using DM App',
        typing: 'false',
        online: DateTime.now().toString(),
        marketName: marketNameCtl.text,
      );
      await appFirebase
          .createUser(userModel)
          .then((userModel) => isloading(false));
      Get.offAllNamed(Routes.NAV_BAR);
    }
  }

  void showPicker(context) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text('Photo Library'),
                onTap: () async {
                  Navigator.pop(context);
                  var status = await AppPermissions().isStoragePermissionOk();
                  switch (status) {
                    case PermissionStatus.denied:
                      var status = await Permission.storage.request().isDenied;
                      // if (!status) {
                      //   pickImage(ImageSource.gallery);
                      // } else {
                        printError(info: 'camera access is denied');
                      // }
                      break;
                    case PermissionStatus.granted:
                      pickImage(ImageSource.gallery);
                      break;
                    case PermissionStatus.restricted:
                      printError(info: 'camera access is denied');
                      break;
                    case PermissionStatus.limited:
                      printError(info: 'camera access is denied');
                      break;
                    case PermissionStatus.permanentlyDenied:
                      await openAppSettings();
                      break;
                    default:
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera_alt_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  var status = await AppPermissions().isCameraPermissionOk();
                  switch (status) {
                    case PermissionStatus.denied:
                      var status = await Permission.camera.request().isDenied;
                      if (!status) {
                        pickImage(ImageSource.camera);
                      } else {
                        printError(info: 'camera access is denied');
                      }
                      break;
                    case PermissionStatus.granted:
                      pickImage(ImageSource.camera);
                      break;
                    case PermissionStatus.restricted:
                      printError(info: 'camera access is denied');
                      break;
                    case PermissionStatus.limited:
                      printError(info: 'camera access is denied');
                      break;
                    case PermissionStatus.permanentlyDenied:
                      await openAppSettings();
                      break;
                    default:
                  }
                },
              )
            ],
          ),
        ),
      ),
    backgroundColor: Theme.of(context).primaryColor, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
    );
  }
}

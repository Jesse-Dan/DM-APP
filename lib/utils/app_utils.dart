import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppUtils {
  Future<File?> imageFromCamera(bool isCropped) async {
    File? result;
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 100);
    if (pickedFile != null) {
      result = File(pickedFile.path);
      if (isCropped) result = await cropImage(result);
    }
    return result;
  }

  Future<File?> imageFromGalery(bool isCropped) async {
    File? result;
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      result = File(pickedFile.path);
      if (isCropped) result = await cropImage(result);
    }
    return result;
  }

  Future<File> cropImage(File imageFile) async {
    late File result;
    CroppedFile? croppedFile = (await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    )) as CroppedFile;
final File mainimageFile = File(croppedFile.path);
    result = mainimageFile;
    return result;
  }
}

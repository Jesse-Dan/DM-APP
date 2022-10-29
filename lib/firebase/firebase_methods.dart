// ignore_for_file: await_only_futures

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divine_mercy_app_the_right_way/authentication/number_verification.dart';
import 'package:divine_mercy_app_the_right_way/authentication/verification_screen.dart';
import 'package:divine_mercy_app_the_right_way/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppFireBase {
  Future<void> sendVerificationCode(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) {
          printInfo(info: 'user verified');
        },
        verificationFailed: (FirebaseAuthException e) {
          printError(info: e.message!);
        },
        codeSent: (String verificationId, int? resendToken) async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('code', verificationId);
          Get.to(() => VerifiactionScreen());
        },
        timeout: Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verification) {});
  }

  Future<void> verifyUser(String otp) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? verificationId = pref.getString('code');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut;
    Get.off(() => const NumberScreen());
  }

  Future<void> createUser(UserModel usermodel) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('users');
    await FirebaseAuth.instance.currentUser!.updateDisplayName(usermodel.name);
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(usermodel.image);
    SharedPreferences.getInstance()
        .then((value) => value.setString('number', usermodel.number));
    return await reference.doc(usermodel.uId).set(usermodel.toJson());
  }

  Future<String> uploadUserImage(String path, String uid, File file) async {
    Reference storage =await FirebaseStorage.instance.ref(uid).child(path);
    UploadTask task =(await  storage.putFile(file)) as UploadTask;
    TaskSnapshot snapshot = await task;
    String link = await snapshot.ref.getDownloadURL();
    return link;
  }
}

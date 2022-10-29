import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../controllers/login_controller.dart';

class VerifiactionScreen extends GetView<LoginCtl> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
          isLoading: controller.isloading.value,
          progressIndicator: SpinKitRotatingPlain(
            color: Theme.of(context).primaryColor,
          ),
          child: Scaffold(
            body: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Container(
                      height: AppBar().preferredSize.height,
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(4, 4))
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Container(
                              width: AppBar().preferredSize.height - 8,
                              height: AppBar().preferredSize.height - 8,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  borderRadius: BorderRadius.circular(32),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            'OTP Verification',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(50),
                            child: AspectRatio(
                              aspectRatio: 2,
                              child:
                                  Image.asset('assets/images/verification.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Input the OTP you recieved',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 24, right: 24, top: 40),
                            child: PinInputTextField(
                              controller: controller.otpsCtl,
                              pinLength: 6,
                              textInputAction: TextInputAction.done,
                              decoration: CirclePinDecoration(
                                strokeColorBuilder: FixedColorBuilder(
                                    Theme.of(context).primaryColor),
                                hintText: '567890',
                                errorText: controller.pinError.value.isEmpty
                                    ? null
                                    : controller.pinError.value,
                                strokeWidth: 2,
                                hintTextStyle: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 24, right: 24, bottom: 30, top: 40),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(4, 4),
                                          blurRadius: 10,
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.1)),
                                    ],
                                    color: Theme.of(context).primaryColor),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {
                                        controller.verifyOtp();
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Center(
                                        child: Text(
                                          'Verfy OTP',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

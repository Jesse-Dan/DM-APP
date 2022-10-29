import 'dart:io';
import 'package:divine_mercy_app_the_right_way/controllers/login_controller.dart';
import 'package:divine_mercy_app_the_right_way/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ProfilePage extends GetView<LoginCtl> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginCtl());

    return Obx(
      () => LoadingOverlay(
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
                // this is to hide the keyboard
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Container(
                        height: AppBar().preferredSize.height,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.1),
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                          ),
                        ], color: Theme.of(context).backgroundColor),
                        child: Center(
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                width: AppBar().preferredSize.height - 8,
                                height: AppBar().preferredSize.height - 8,
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(32),
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                                child: Text(
                              'Profile ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: TextButton(
                                onPressed: () {
                                  // controller.appFirebase.createUser(usermodel)
                                },
                                child: const Text('skip'),
                              ),
                            ),
                          ]),
                        ))),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 24, top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .disabledColor
                                                    .withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: const Offset(4, 4))
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        // child: null,
                                        child:
                                            controller.selectedImage.value == ''
                                                ? const Icon(Icons.person)
                                                : Image.file(
                                                    File(
                                                      controller
                                                          .selectedImage.value,
                                                    ),
                                                  ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 3,
                                      right: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context).disabledColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .disabledColor
                                                    .withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: const Offset(4, 4))
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            onTap: () {
                                              controller.showPicker(context);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Icon(
                                                Icons.add_a_photo_rounded,
                                                color: Theme.of(context)
                                                    .backgroundColor,
                                                size: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: InputsText(
                                    hintText: 'Name...',
                                    ctl: controller.nameCtl,
                                    errorText: controller.nameError.value),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InputsText(
                            ctl: controller.emailCtl,
                            hintText: 'User Email...',
                            errorText: controller.emailError.value,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InputsText(
                            ctl: controller.marketNameCtl,
                            hintText: 'Market Name...',
                            errorText: controller.marketNameError.value,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 24, left: 24, bottom: 30),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.1),
                                    offset: const Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    controller.uploadUserData();
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ])),
        ),
      ),
    );
  }
}

class InputsText extends StatelessWidget {
  const InputsText({
    Key? key,
    required this.hintText,
    required this.ctl,
    required this.errorText,
  }) : super(key: key);
  final String hintText;
  final TextEditingController ctl;
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).disabledColor.withOpacity(0.1),
            offset: const Offset(4, 4),
            blurRadius: 10,
          ),
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            height: 48,
            child: Center(
              child: TextField(
                controller: ctl,
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    errorMaxLines: 1,
                    contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                    errorText: errorText == '' ? null : errorText,
                    border: InputBorder.none,
                    hintText: hintText),
              ),
            ),
          )),
    );
  }
}

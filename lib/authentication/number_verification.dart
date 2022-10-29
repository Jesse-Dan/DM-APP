// ignore_for_file: avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../controllers/login_controller.dart';

class NumberScreen extends GetView<LoginCtl> {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          // this is to hide the keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                height: AppBar().preferredSize.height,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).disabledColor.withOpacity(0.1),
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                ], color: Theme.of(context).backgroundColor),
                child: Center(
                  child: Row(
                    children: [
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
                        'Registration ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: Image.asset('assets/images/otp.png'),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "We'll send you a one time otp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 40,
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(4, 4))
                              ],
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CountryCodePicker(
                              favorite: const ['Nigeria', 'United States'],
                              closeIcon: Icon(
                                Icons.close,
                                color: Theme.of(context).primaryColor,
                              ),
                              initialSelection: 'Nigeria',
                              textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              onChanged: ((value) {
                                controller.code = value.toCountryStringOnly();
                                print(controller.code);
                              }),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Obx(
                          () => Container(
                            width: (MediaQuery.of(context).size.width / 2 + 40),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(4, 4))
                              ],
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: TextField(
                                enableInteractiveSelection: true,
                                controller: controller.numberCtl,
                                keyboardType: TextInputType.number,
                                cursorColor: Theme.of(context).primaryColor,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  errorMaxLines: 1,
                                  contentPadding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  errorText:
                                      controller.numberError.value.isEmpty
                                          ? null
                                          : controller.numberError.value,
                                  border: InputBorder.none,
                                  hintText: 'Mobile...',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(4, 4))
                                    ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.sendOtp();
                          // Get.off(() => const VerifiactionScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: MediaQuery.of(context).size.width / 5,
                              right: MediaQuery.of(context).size.width / 5),
                          child: const Center(
                            child: Text(
                              "Generate OTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

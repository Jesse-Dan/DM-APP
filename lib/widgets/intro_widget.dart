import 'package:divine_mercy_app_the_right_way/models/intro_model.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  final IntroModel introModel;
  const IntroView({Key? key, required this.introModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  introModel.assetImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              introModel.titleText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
          flex: 1,
        )
      ],
    );
  }
}

import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.text1,
    required this.text2,
    required this.icon1,
    required this.icon2,
  }) : super(key: key);
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kdefaultPadding + 10, right: kdefaultPadding + 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                text1,
                style: const TextStyle(fontSize: 15, color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon1, size: 15, color: Colors.blue),
              )
            ],
          ),
          Row(
            children: [
              Text(
                text2,
                style: const TextStyle(fontSize: 15, color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon2, size: 15, color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }
}

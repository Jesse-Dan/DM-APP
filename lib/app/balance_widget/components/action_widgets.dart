import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    smallbtn(String text, Color color, Function callBack) {
      return GestureDetector(
        onTap: () => callBack,
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black26,
                    blurRadius: 20)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        smallbtn('Deposit', Colors.amber, () {}),
        smallbtn('Withdraw', Colors.grey, () {}),
        smallbtn('Transfer', Colors.grey, () {}),
      ],
    );
  }
}

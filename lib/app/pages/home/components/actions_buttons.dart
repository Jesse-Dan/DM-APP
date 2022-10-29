// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        ActionsBtn(
          topleftradius: 0,
          topRightradius: 0,
          bottomleftradius: 20,
          bottomRightradius: 0,
          icons: Icons.notifications_active,
          text: 'Notification',
          size: 20,
        ),
        ActionsBtn(
          topleftradius: 0,
          topRightradius: 0,
          bottomleftradius: 0,
          bottomRightradius: 20,
          icons: Icons.shopping_cart_rounded,
          text: 'Cart',
          size: 20,
        ),
      ],
    );
  }
}

class ActionsBtn extends StatelessWidget {
  const ActionsBtn({
    Key? key,
    required this.topleftradius,
    required this.topRightradius,
    required this.bottomleftradius,
    required this.bottomRightradius,
    required this.icons,
    required this.text,
    required this.size,
  }) : super(key: key);
  final double topleftradius;
  final double topRightradius;
  final double bottomleftradius;
  final double bottomRightradius;
  final IconData icons;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topleftradius),
                bottomLeft: Radius.circular(bottomleftradius),
                topRight: Radius.circular(topRightradius),
                bottomRight: Radius.circular(bottomRightradius),
              ),
              color: Colors.blueGrey,
              boxShadow: const [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black26,
                    blurRadius: 20)
              ]),
          padding: const EdgeInsets.all(kdefaultPadding),
          // height: 20,
          // width: 20,
          child: Row(
            children: [
              Icon(
                icons,
                size: size,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}

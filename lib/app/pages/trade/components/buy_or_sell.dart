import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

class BuyOrSell extends StatefulWidget {
  const BuyOrSell({super.key});

  @override
  State<BuyOrSell> createState() => _BuyOrSellState();
}

class _BuyOrSellState extends State<BuyOrSell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(kdefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kdefaultwhite,
                    borderRadius: BorderRadius.circular(midikdefaultradius)),
                height: MediaQuery.of(context).size.height / 3.7 - 50,
                width: MediaQuery.of(context).size.width / 2 - 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kdefaultYellow,
                    borderRadius: BorderRadius.circular(midikdefaultradius)),
                height: MediaQuery.of(context).size.height / 3.7 - 50,
                width: MediaQuery.of(context).size.width / 2 - 20,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: kdefaultwhite,
                borderRadius: BorderRadius.circular(midikdefaultradius)),
            height: MediaQuery.of(context).size.height / 2 - 50,
            width: MediaQuery.of(context).size.width / 2 - 20,
          ),
        ],
      ),
    ));
  }
}

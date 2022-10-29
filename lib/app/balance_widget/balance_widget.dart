import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/action_widgets.dart';
import 'components/coin_type_owned_widget.dart';
import 'components/wallet_balance.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kdefaultPadding,
        left: kdefaultPadding,
        right: kdefaultPadding,
        bottom: kdefaultPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(minikdefaultradius)),
        child: Padding(
          padding: const EdgeInsets.all(kdefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CoinTypeOwned(),
                  const WalletBalance(),
                  Row(
                    children: const [
                      Text(
                        'Today\'s PNL',
                        style: TextStyle(fontSize: 10),
                      ),
                      Icon(
                        Icons.info,
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
              const ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

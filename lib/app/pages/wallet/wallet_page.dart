import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key, required String title});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(kdefaultPadding),
          child: Container(
            color: Colors.amber,
            child: const Padding(
              padding: EdgeInsets.all(kdefaultPadding),
              child: Text('wallet'),
            ),
          ),
        ),
        const Card(
          color: Colors.amber,
        )
      ],
    );
  }
}

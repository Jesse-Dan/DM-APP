import 'package:flutter/material.dart';

class CoinTypeOwned extends StatefulWidget {
  const CoinTypeOwned({
    Key? key,
  }) : super(key: key);

  @override
  State<CoinTypeOwned> createState() => _CoinTypeOwnedState();
}

class _CoinTypeOwnedState extends State<CoinTypeOwned> {
  @override
  Widget build(BuildContext context) {
    bool isvisible = true;
    check() {
      setState(() {
        isvisible = !isvisible;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Total Value (BTC)',
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: check,
              child: const Icon(
                Icons.visibility_off,
                size: 18,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ],
    );
  }
}

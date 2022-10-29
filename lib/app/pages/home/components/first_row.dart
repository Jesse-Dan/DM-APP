import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text(
              'Total Market Presence',
              style: TextStyle(fontSize: 10, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Icon(Icons.timelapse_rounded, size: 20, color: Colors.blue),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Transaction History',
              style: TextStyle(fontSize: 10, color: Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Icon(Icons.dashboard_rounded, size: 20, color: Colors.blue),
            )
          ],
        )
      ],
    );
  }
}

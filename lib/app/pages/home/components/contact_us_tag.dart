import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ContactUsTag extends StatelessWidget {
  const ContactUsTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(kdefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('contact us for support'),
            Icon(
              Icons.headset_mic_rounded,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}

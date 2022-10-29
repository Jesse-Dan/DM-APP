import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.only(left:kdefaultPadding),
      child: CircleAvatar(
        radius: 14,
        backgroundImage: AssetImage("assets/images/user_2.png"),
      ),
    );
  }
}

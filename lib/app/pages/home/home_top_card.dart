import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'components/actions_buttons.dart';
import 'components/first_row.dart';

class HomeTopCard extends StatelessWidget {
  const HomeTopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kdefaultPadding),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: kdefaultwhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(kdefaultPadding),
          child: Column(
            children: [
              const FirstRow(),
              const SizedBox(height: 20),
              // Vendors(),
              Row(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        ActionsBtn(
                            topleftradius: 20,
                            topRightradius: 0,
                            bottomleftradius: 0,
                            bottomRightradius: 0,
                            icons: Icons.ssid_chart_sharp,
                            text: 'Trades',
                            size: 20),
                        ActionsBtn(
                            topleftradius: 0,
                            topRightradius: 20,
                            bottomleftradius: 0,
                            bottomRightradius: 0,
                            icons: Icons.area_chart_outlined,
                            text: 'Market',
                            size: 20),
                      ],
                    ),
                    const ActionButtons(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.blue,
                        shadows: [Shadow(blurRadius: 20, color: Colors.grey)],
                      ),
                    ),
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

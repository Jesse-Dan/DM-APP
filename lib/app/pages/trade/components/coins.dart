import 'package:divine_mercy_app_the_right_way/app/pages/home/components/others.dart';
import 'package:flutter/material.dart';


class Coins extends StatelessWidget {
  const Coins({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Others()
        // ListView.builder(
        //   itemCount: 30,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Padding(
        //         padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        //         child:
        //             //  Container(
        //     padding: EdgeInsets.all(StyleConstants.kdefaultpadding - 10),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(minikdefaultradius),
        //       color: kdefaultwhite,
        //       // boxShadow: const [
        //       //   BoxShadow(
        //       //       blurStyle: BlurStyle.outer,
        //       //       color: Colors.black26,
        //       //       blurRadius: 35)
        //       // ]
        //     ),
        //     height: 90,
        //     width: MediaQuery.of(context).size.width / 5,
        //     child:
        //       const Center(
        // child: Text('Text'),
        // )
        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           children: [
        //             const Text(
        //               'ALBA/USDT  ',
        //               style: TextStyle(
        //                   fontSize: 20, fontWeight: FontWeight.bold),
        //             ),
        //             FaIcon(
        //               (index % 2) == 0
        //                   ? FontAwesomeIcons.chartGantt
        //                   : Icons.ssid_chart_rounded,
        //               color: (index % 2) == 0 ? Colors.green : Colors.red,
        //             ),
        //           ],
        //         ),
        //         Container(
        //           padding: const EdgeInsets.all(8),
        //           decoration: BoxDecoration(
        //               color: (index % 2) == 0 ? Colors.green : Colors.red,
        //               borderRadius: BorderRadius.circular(10)),
        //           child: Text((index % 2) == 0 ? '+0.42' : '-0.821'),
        //         ),
        //       ],
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(top: 5),
        //       child: Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               const Text(
        //                 'Watch Point',
        //                 style: TextStyle(fontSize: 10),
        //               ),
        //               Text(
        //                 (index % 2) == 0 ? '1.00072321' : '0.00009236',
        //                 style: const TextStyle(fontSize: 10),
        //               )
        //             ],
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               const Text(
        //                 'Present Point',
        //                 style: TextStyle(fontSize: 10),
        //               ),
        //               Text(
        //                 (index % 2) == 0 ? '1.00072321' : '0.00009236',
        //                 style: const TextStyle(fontSize: 10),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
        //           ),
        );
    //     },
    //   ),
    // );
  }
}

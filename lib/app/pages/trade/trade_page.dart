// ignore_for_file: prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import '../home/components/title_widget.dart';
import 'components/buy_or_sell.dart';
import 'components/coins.dart';

class TradPage extends StatefulWidget {
  const TradPage({super.key, required String title});
  @override
  State<TradPage> createState() => _TradPageState();
}

class _TradPageState extends State<TradPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: const [
            BuyOrSell(),
            TitleWidget(
                text1: 'Crypto Market',
                text2: 'view more',
                icon1: Icons.multiline_chart,
                icon2: Icons.arrow_forward_ios_rounded),
            Coins(),
          ],
        ),
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);
    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);
    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

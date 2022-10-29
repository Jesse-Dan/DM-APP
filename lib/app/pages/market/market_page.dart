import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key, required String title});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.amber,child:const  Text('market'),);
  }
}
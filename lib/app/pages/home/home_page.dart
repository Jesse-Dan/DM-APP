import 'package:divine_mercy_app_the_right_way/app/balance_widget/balance_widget.dart';
import 'package:divine_mercy_app_the_right_way/app/pages/home/components/title_widget.dart';
import 'package:flutter/material.dart';
import 'home_top_card.dart';
import 'components/others.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          BalanceView(),
          HomeTopCard(),
          TitleWidget(
            text1: 'Services',
            text2: 'more',
            icon1: Icons.account_tree_rounded,
            icon2: Icons.arrow_forward_ios_rounded,
          ),
          Others(),          
        ],
      ),
    );
  }
}

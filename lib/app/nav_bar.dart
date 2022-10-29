import 'package:divine_mercy_app_the_right_way/app/appbar/components/profile_widget.dart';
import 'package:divine_mercy_app_the_right_way/app/pages/chatroom/chatroom_page.dart';
import 'package:divine_mercy_app_the_right_way/app/pages/search/search_page.dart';
import 'package:divine_mercy_app_the_right_way/app/pages/trade/trade_page.dart';
import 'package:divine_mercy_app_the_right_way/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/constants.dart';
import 'drawer_page.dart';
import 'pages/home/home_page.dart';
import 'pages/market/market_page.dart';

class ButtomNav extends StatefulWidget {
  const ButtomNav({super.key, required String title});

  @override
  State<ButtomNav> createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final kTabPages = [
      const HomePage(title: 'home page'),
      const TradPage(title: 'chatroom'),
      const MarketPage(title: 'market'),
      // ChatsScreen(context),
      const ChatRoomPage(title: 'chatroom'),
      const HomePage(title: 'title')
    ];
    final kButtomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded), label: 'home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.currency_bitcoin_rounded), label: 'trade'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.area_chart_outlined), label: 'market'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded), label: 'chatroom'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.wallet_rounded), label: 'wallet')
    ];
    assert(kTabPages.length == kButtomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: kButtomNavBarItems,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: Colors.grey,
      selectedItemColor: kdefaultBlue,
      elevation: 40,
      onTap: ((value) {
        setState(() {
          _currentIndex = value;
        });
      }),
    );

    return Scaffold(
      appBar: ourAppBar(),
      drawer: Drawer(child: ListView()),
      body: kTabPages[_currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }

  AppBar ourAppBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Get.to(() => const CustomDrawer());
          },
          child: const ProfilePhoto()),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              Get.to(() => SearchPage());
            },
            icon: const Icon(
              Icons.search,
              size: 20,
              color: Colors.blue,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              size: 20,
              color: Colors.blue,
            )),
        Padding(
          padding: const EdgeInsets.only(right: kdefaultPadding),
          child: IconButton(
              onPressed: () async {
                AppFireBase().signOut();
              },
              icon: const Icon(
                Icons.exit_to_app,
                size: 20,
                color: Colors.blue,
              )),
        )
      ],
    );
  }
}

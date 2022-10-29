import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kdefaultPadding - 15),
        child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            padding: const EdgeInsets.all(kdefaultPadding),
            clipBehavior: Clip.none,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 0.7,
              children: [
                serviceWidget("sendMoney", "Send\nMoney"),
                serviceWidget("receiveMoney", "Receive\nMoney"),
                serviceWidget("phone", "Mobile\nRecharge"),
                serviceWidget("electricity", "Electricity\nBill"),
                serviceWidget("tag", "Cashback\nOffer"),
                serviceWidget("movie", "Movie\nTicket"),
                serviceWidget("flight", "Flight\nTicket"),
                serviceWidget("more", "More...\n"),
              ],
            )));
  }

  Column serviceWidget(String img, String name) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xfff1f3f6),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/$img.png'))),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'avenir',
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Container avatarWidget(String img, String name) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 150,
      width: 120,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xfff1f3f6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('asset/images/$img.png'),
                    fit: BoxFit.contain),
                border: Border.all(color: Colors.black, width: 2)),
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

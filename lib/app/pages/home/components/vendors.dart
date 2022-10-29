// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Vendors extends StatelessWidget {
  const Vendors({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width / 1.1,
      child: ListView.builder(
          // clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person_add_rounded),
                      const VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Jesse Electronics',
                            style: TextStyle(fontSize: 10),
                          ),
                          const Text(
                            'Finn Jesse Dan',
                            style: TextStyle(fontSize: 10),
                          ),
                          const Text(
                            'C.E.O ',
                            style: TextStyle(fontSize: 10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red),
                            child: Column(children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'General Sales of \n Electronics',
                                  style: TextStyle(fontSize: 10),
                                ),
                              )
                            ]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

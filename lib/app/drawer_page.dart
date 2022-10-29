import 'package:divine_mercy_app_the_right_way/app/create_user_page.dart';
import 'package:divine_mercy_app_the_right_way/firebase/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String userName = '';
  String userEmail = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: ourappbar(context),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 50),
              children: <Widget>[
                Icon(
                  Icons.account_circle_rounded,
                  size: 150,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Jesse Dan',
                  // userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 30),
                const Divider(height: 2),
                ListTile(
                  onTap: () {
                    Get.to(() => ProfilePage());
                  },
                  selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                ),
                const Divider(height: 2),
                ListTile(
                  onTap: () {},
                  selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Divider(height: 2),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Logout'),
                              content: Text('Are you sure you log out?'),
                              actions: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Row(
                                          children: [
                                            Text('No'),
                                            Icon(Icons.close),
                                          ],
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          AppFireBase().signOut();
                                        },
                                        child: Row(
                                          children: [
                                            Text('yes'),
                                            Icon(Icons.done),
                                          ],
                                        )),
                                  ],
                                ),
                              ]);
                        });
                  },
                  selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Log Out'),
                ),
                const Divider(height: 2),
              ],
            ),
          );
        });
  }

  AppBar ourappbar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
          color: Colors.blue,
        ));
  }
}

// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';

// router page
import '../charging _stations/chargingstations_list.dart';
import '../favorite/favorite.dart';
import '../home/home.dart';
import 'package:toggapp/screen/profile_screen/profile.dart';

// theme data
import '../../theme/mainthemecolor.dart';

class mainBottomMenuScreen extends StatefulWidget {
  const mainBottomMenuScreen({super.key});

  @override
  State<mainBottomMenuScreen> createState() => _mainBottomMenuScreenState();
}

class _mainBottomMenuScreenState extends State<mainBottomMenuScreen> {
  int selectStartIndex = 3;

  static final List<Widget> mainScreens = <Widget>[
    const profileScreen(),
    const FavoriteScreen(),
    const chargingStationsListScreen(),
    const homeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectStartIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: mainScreens.elementAt(selectStartIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: themeMainColorData.iconTheme
              .copyWith(color: themeMainColorData.colorScheme.background),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
                size: 22,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                size: 22,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.grey,
                size: 22,
              ),
              activeIcon: Icon(
                Icons.favorite,
                size: 22,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.charging_station_outlined,
                color: Colors.grey,
                size: 22,
              ),
              activeIcon: Icon(
                Icons.charging_station,
                size: 22,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 22,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 22,
              ),
              label: "",
            ),
          ],
          currentIndex: selectStartIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Uygulamadan Çıkmakmı İstiyorsun?",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          child: const Text("Evet"),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Hayır",
                            style: TextStyle(color: Colors.black)),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/screens/Fav.dart';
import 'package:food_delivery_app/screens/Home.dart';
import 'package:food_delivery_app/screens/Search.dart';
import 'package:food_delivery_app/screens/Settings.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    FavPage(),
    SearchPage(),
    SettingsPage(),
  ];

  void onTabTabbed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: AppColors.white,
        iconSize: 25,
        selectedItemColor: AppColors.orange,
        onTap: onTabTabbed,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}

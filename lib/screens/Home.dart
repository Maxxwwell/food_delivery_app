// ignore_for_file: file_names

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/screens/tabs/Food.dart';
import 'package:food_delivery_app/screens/tabs/Meat.dart';
import 'package:food_delivery_app/screens/tabs/Sandwiches.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          Badge(
            badgeContent: const Text(
              '3',
              style: TextStyle(color: AppColors.white),
            ),
            child: const Icon(Icons.shopping_cart_outlined,
                color: AppColors.black),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    "What would you like to order?",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icons/bento-box.png',
                  height: 60,
                  width: 60,
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.orange,
                    isScrollable: true,
                    labelColor: AppColors.orange,
                    unselectedLabelColor: AppColors.grey,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.only(top: 10),
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    indicator: DotIndicator(color: AppColors.orange, radius: 3),
                    tabs: const [
                      Tab(
                        child: Text('Sandwiches'),
                      ),
                      Tab(
                        child: Text('Food'),
                      ),
                      Tab(
                        child: Text('Meat'),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: double.infinity,
                      child: TabBarView(
                        controller: _tabController,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          SandWichesPage(),
                          MeatPage(),
                          FoodPage(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

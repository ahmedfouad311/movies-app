// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moviesapp/screens/browse/browse_tab.dart';
import 'package:moviesapp/screens/home/home_tab.dart';
import 'package:moviesapp/screens/search/search_tab.dart';
import 'package:moviesapp/screens/watchlist/watchlist_tab.dart';
import 'package:moviesapp/theme/my_theme_data.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 19, 18, 1.0),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: MyThemeData.primaryColor),
        child: BottomNavigationBar(
          currentIndex: currentTab,
          selectedItemColor: MyThemeData.selectedItem,
          unselectedItemColor: MyThemeData.unselectedItem,
          onTap: (index) {
            setState(() {
              currentTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home, size: 30,)
            ),
            BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(Icons.search, size: 30,)
            ),
            BottomNavigationBarItem(
                label: 'Browse',
                icon: Icon(Icons.movie, size: 30,)
            ),
            BottomNavigationBarItem(
                label: 'Watch List',
                icon: Transform(transform: Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: Icon(Icons.collections_bookmark_rounded, size: 30,),
                )
            ),
          ],
        ),
      ),
      body: Container(
        child: tabs[currentTab],
      ),
    );
  }
}

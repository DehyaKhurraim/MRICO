import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Screens/DetailScreen.dart';

import '../ThemeConfig/Colors.dart';
import '../ThemeConfig/Colors.dart';
import '../widgets/bottombar_items.dart';
import 'HomeScreen.dart';
import 'Profile.dart';
import 'PropertiesSeeAllScreen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Widget? _child;
  @override
  void initState() {
    _child = HomeScreen();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(239, 239, 239, 100),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.feed_outlined,
                backgroundColor: ktriColor,
                extras: {"label": "home"}),
            FluidNavBarIcon(
                icon: Icons.home_outlined,
                backgroundColor: kPrimaryColor,
                extras: {"label": "account"}),
            FluidNavBarIcon(
                icon: Icons.bookmark_add_outlined,
                backgroundColor: kPrimaryColor,
                extras: {"label": "settings"}),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(
              iconSelectedForegroundColor: kPrimaryColor,
              iconUnselectedForegroundColor: Colors.white60),
          scaleFactor: 1.5,
          defaultIndex: 1,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeScreen();
          break;
        case 1:
          _child = HomeScreen();
          break;
        case 2:
          _child = HomeScreen();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 50),
        child: _child,
      );
    });
  }
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;
  final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": const HomePage(),
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": const HomeScreen(),
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "page": const PropertiesSeeAllScreen(),
    },
    {
      "icon": Icons.forum_outlined,
      "active_icon": Icons.forum_rounded,
      "page": const DetailWidget(),
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": const ProfileScreen(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _barItems.length,
        (index) => _barItems[index]["page"],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? _barItems[index]["active_icon"]
                : _barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: ktriColor,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

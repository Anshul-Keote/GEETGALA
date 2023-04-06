import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/screens/pages/homepage.dart';
import 'pages/account.dart';
import 'pages/add.dart';
// import 'pages/home.dart';
import 'pages/reels.dart';
import 'pages/library.dart';

class TabsController extends StatefulWidget {
  // const TabsController({super.key});

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  var _selectedIndex = 0;

  static List<Widget> _pages = [
    HomePage(),
    Add(),
    DisplayVideo_Screen(),
    Account(),
    Library(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Color(0xFFFFD964),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, color: Color(0xFF211614),),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add,color: Color(0xFF211614),),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.play,color: Color(0xFF211614),),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled,color: Color(0xFF211614),),

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet,color: Color(0xFF211614),),

          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Scaffold(
              body: SafeArea(
                left: true,
                top: true,
                right: true,
                bottom: true,
                child: _pages[index],
              ),
            );
          },
        );
      },
    );
  }
}

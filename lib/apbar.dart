import 'package:flutter/material.dart';
import 'package:flutter_app/setting.dart';

import 'categories.dart';
import 'home.dart';
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Sans"),)
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.category),
        title: new Text('Categories',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: "Sans"),),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Sans"),)
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Home(), categories(), Setting()
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),
            ),
            Text(
              'Wallpapers',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  fontFamily: "Sans"),
            )
          ],
        ),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import 'Categories_Screen.dart';

import 'home_Screen.dart';
import 'user_Screen.dart';

import 'aboutApp_Screen.dart';

import 'aboutUs_Screen.dart';




class Layouts extends StatefulWidget {
  const Layouts({super.key});

  @override
  State<Layouts> createState() => _LayoutState();
}

class _LayoutState extends State<Layouts> {

  List<Widget> _Screens = <Widget>[
      HomeScreen(),
     UserScreen(),
    CategoriesScreen(),
      AboutappScreen(),
       AboutusScreen(),
  ];


  int Current_Index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      _Screens[Current_Index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 15,
        backgroundColor: Colors.blue,
        currentIndex: Current_Index,
        onTap: (index) {
          setState(() {
            Current_Index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About App"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: "About Us"),
        ],
      ),
    );
  }
}

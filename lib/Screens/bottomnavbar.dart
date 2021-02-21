import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/appointment.dart';
import 'package:flutter_app_itshare/Screens/home.dart';
import 'package:flutter_app_itshare/Screens/profile.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current = 0;
  List screens = [HomePage(), Appointments(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Appointment'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: 'Profile'),
        ],
        currentIndex: current,
        selectedItemColor: Color(0xff00BBDC),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
}

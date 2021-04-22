import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Models/myProvider.dart';
import 'package:flutter_app_itshare/Screens/appointment.dart';
import 'package:flutter_app_itshare/Screens/home.dart';
import 'package:flutter_app_itshare/Screens/profile.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

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
        currentIndex: Provider.of<MyProvider>(context,listen: false).current,
        selectedItemColor: Color(0xff00BBDC),
        unselectedItemColor: Colors.grey,
        onTap:(index){ Provider.of<MyProvider>(context,listen: false).changeScreen(index);}
      ),
      body: Provider.of<MyProvider>(context,listen: false).screens[Provider.of<MyProvider>(context).current],
    );
  }
}

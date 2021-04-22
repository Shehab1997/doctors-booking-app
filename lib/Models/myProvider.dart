import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/appointment.dart';
import 'package:flutter_app_itshare/Screens/home.dart';
import 'package:flutter_app_itshare/Screens/profile.dart';

class MyProvider with ChangeNotifier {
  int current = 0;
  List screens = [HomePage(), Appointments(), ProfilePage()];

  changeScreen(index) {
   current=index;
    notifyListeners();
  }
}



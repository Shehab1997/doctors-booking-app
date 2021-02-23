import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/win10/AndroidStudioProjects/flutter_app_itshare/lib/Screens/home.dart';
import 'file:///C:/Users/win10/AndroidStudioProjects/flutter_app_itshare/lib/Screens/profile.dart';
import 'package:flutter_app_itshare/Screens/bottomnavbar.dart';
import 'package:flutter_app_itshare/Screens/browse.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

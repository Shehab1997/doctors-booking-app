import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Models/auth.dart';
import 'package:flutter_app_itshare/Models/myProvider.dart';
import 'package:flutter_app_itshare/Models/secondProvider.dart';
import 'package:flutter_app_itshare/Screens/bottomnavbar.dart';
import 'package:flutter_app_itshare/Screens/signIn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_itshare/Models/categories/categoryController.dart';

import 'Screens/splash.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String? data;

  @override
  void initState() {
    checkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Splash(),
            debugShowCheckedModeBanner: false,
          );
        } else {
          // Loading is done, return the app:
          return MultiProvider(providers: [
            ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider()),
            ChangeNotifierProvider<SecondProvider>(create: (_)=>SecondProvider()),
            ChangeNotifierProvider<CategoryController>(create: (_)=>CategoryController()),
            ChangeNotifierProvider<Auth>(create:(_)=>Auth())
          ],
            child: MaterialApp(
              home: !data!.contains("shehab@1") ? SignIn() : BottomNavBar(),
              debugShowCheckedModeBanner: false,
            ),
          );
        }
      },
    );
  }

  checkData() async {
    try {
      SharedPreferences _user = await SharedPreferences.getInstance();
      String _data = _user.getString('email')!;
      if (_data == null) {
        (() {
          data = _data;
        });
      } else {
        setState(() {
          data = _data;
        });
      }
    } catch (e) {
      return false;
    }
  }
}

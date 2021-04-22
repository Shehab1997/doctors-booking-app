import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50),
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logoo.png')),
                  shape: BoxShape.circle),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50),
              height: 250,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Welcome to Dr.Health'
                     ,
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}

/*import "package:flutter/material.dart";

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, List> itemData = {
    0: ['setting', 'Edit your app setting', Icons.settings],
    1: ['My account', 'see your account data', Icons.account_circle],
    2: ['Contact us', 'contact us to get help', Icons.phone],
    3: ['About us', 'know more about us ', Icons.info],
    4: ['Follow us', 'Follow us on social media', Icons.mail]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome Manal', style: TextStyle(color: Colors.amber)),
        ),
        drawer: Drawer(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: itemData.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.greenAccent,Colors.blueAccent] ),
                      border: Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(15.0)),
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ListTile(
                    leading: Icon(
                      itemData[index][2],
                      size: 20,
                      color: Colors.amber,
                    ),
                    title: Text(
                      itemData[index][0],
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    subtitle: Text(
                      itemData[index][1],
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber,
                    ),
                  ),
                );
              }),
        ));
  }
}
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/home.dart';
import 'package:flutter_app_itshare/profile.dart';

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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

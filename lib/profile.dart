import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.5),
                    bottomRight: Radius.circular(15.5)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.cyanAccent, Colors.blueAccent],
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(Icons.close_rounded),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                ListTile(
                  contentPadding: EdgeInsets.all(20),
                  leading: CircleAvatar(
                    minRadius: 35,
                    maxRadius: 35,
                    backgroundImage: AssetImage('assets/images/shehab.jpg'),
                  ),
                  title: Text(
                    'Shehab Ahmed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'VIEW PROFILE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff03CBC8),
                size: 35,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Color(0xff03CBC8),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          options(Icons.calendar_today_outlined, 'My Appointments'),
          options(Icons.add_box, 'My Medicine Delivery Orders'),
          options(Icons.favorite_outline_sharp, 'Favorites'),
          options(Icons.credit_card_rounded, 'Payment Details'),
          options(Icons.logout, 'Logout')
        ],
      ),
    );
  }

  options(IconData iconz, String op) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(
          iconz,
          color: Colors.black,
          size: 35,
        ),
        title: Text(
          op,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

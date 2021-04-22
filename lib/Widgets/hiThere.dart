import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class TopItems extends StatefulWidget {
 String what;
  TopItems(this.what);
  @override
  _TopItemsState createState() => _TopItemsState();
}

class _TopItemsState extends State<TopItems> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.pinclipart.com/picdir/big/217-2173523_being-a-doctor-it-is-difficult-for-everyone.png")),
            shape: BoxShape.circle),
      ),
      subTittle('Bleep Med'),
      subTittle('Doctor at your doorstep'),


    ]);
  }

  subTittle(String sub) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Text(
          sub,
          style: sub == 'Bleep Med'
              ? TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold)
              : TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ));
  }


}

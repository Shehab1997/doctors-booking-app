import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/profile.dart';

class CustomAppBar extends StatefulWidget {
  final double height;
  final String text;
  final Widget secondPart;
final IconData iconz;
  CustomAppBar(this.height, this.text, this.secondPart,this.iconz);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: widget.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.cyanAccent, Colors.blueAccent]),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.5),
              bottomLeft: Radius.circular(15.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
                  widget.iconz,
                  color: Colors.white,
                  size: 35,
                ),
          Text(
            widget.text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.normal),
          ),
          widget.secondPart,
        ],
      ),
    );
  }
}

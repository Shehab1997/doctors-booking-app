import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Models/auth.dart';
import 'package:provider/provider.dart';

class SignBtn extends StatefulWidget {
  final String text;
  final Color color;
   TextEditingController s;
   TextEditingController d;

  SignBtn(this.text, this.color, {required this.s, required this.d});

  @override
  _SignBtnState createState() => _SignBtnState();
}

class _SignBtnState extends State<SignBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(40, 5, 40, 10),
        height: 50,
        decoration: BoxDecoration(
            border: widget.text == 'Login' || widget.text == 'Create account'
                ? null
                : Border.all(color: Colors.grey, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: widget.text == 'Login' || widget.text == 'Create account'
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightBlue, Colors.tealAccent])
                : null),
        child: TextButton(
          onPressed: () async {
            widget.text == 'Create account'
                ? await Provider.of<Auth>(context, listen: false)
                    .signUp(widget.s.text, widget.d.text)
                : null;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.text == "Login" || widget.text == 'Create account'
                  ? SizedBox()
                  : CircleAvatar(
                      minRadius: 15.0,
                      maxRadius: 15.0,
                      backgroundImage: NetworkImage(
                          'https://www.pngitem.com/pimgs/m/118-1181708_google-icon-google-logo-design-flaws-hd-png.png'),
                    ),
              Text(
                widget.text,
                style: TextStyle(
                    color: widget.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ));
  }
}

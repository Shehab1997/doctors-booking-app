import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Models/secondProvider.dart';
import 'package:flutter_app_itshare/Screens/signIn.dart';
import 'package:flutter_app_itshare/Screens/signUp.dart';
import 'package:provider/provider.dart';

class FlatBtn extends StatefulWidget {
  final String flat;

  FlatBtn(this.flat);

  @override
  _FlatBtnState createState() => _FlatBtnState();
}

class _FlatBtnState extends State<FlatBtn> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: widget.flat == "Forget Password?"
            ? Alignment.bottomRight
            : Alignment.bottomCenter,
        child: widget.flat == "Forget Password?"
            ? TextButton(onPressed: null, child: Text(widget.flat))
            : TextButton(
                onPressed: widget.flat == "Not an existing user?"
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      }
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                child: widget.flat == "Have an account?" ||
                        widget.flat == "Not an existing user?"
                    ? Text(
                        widget.flat,
                        style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Checkbox(
                                value:
                                    Provider.of<SecondProvider>(context).pass,
                                onChanged: (value) {
                                  Provider.of<SecondProvider>(context,
                                          listen: false)
                                      .hidePass();
                                }),
                            Text(
                              widget.flat,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ])));
  }
}

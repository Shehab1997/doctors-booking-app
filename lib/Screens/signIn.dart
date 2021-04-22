import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/bottomnavbar.dart';
import 'package:flutter_app_itshare/Widgets/hiThere.dart';
import 'package:flutter_app_itshare/Widgets/textField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_itshare/Widgets/flatBtn.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  GlobalKey<FormState>? emailKey = GlobalKey<FormState>();
  GlobalKey<FormState>? passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FB),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              TopItems('SignIn'),
              TextFieldCus(emailKey!, emailController!, "Email Address",
                  TextInputType.emailAddress),
              TextFieldCus(
                passwordKey!,
                passwordController!,
                'Password',
                TextInputType.visiblePassword,
              ),
              FlatBtn('Forget Password?'),
              button('Login', Colors.white),
              button("  Continue with Google", Colors.grey),
              SizedBox(
                height: 50,
              ),
              FlatBtn("Not an existing user?"),
            ],
          ),
        ),
      ),
    );
  }

  button(
    String text,
    Color color,
  ) {
    return Container(
        margin: EdgeInsets.fromLTRB(40, 5, 40, 10),
        height: 50,
        decoration: BoxDecoration(
            border: text == 'Login'
                ? null
                : Border.all(color: Colors.grey, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: text == 'Login'
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightBlue, Colors.tealAccent])
                : null),
        child: TextButton(
          onPressed: () {
            text == 'Login' ? submit() : null;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text == "Login"
                  ? SizedBox()
                  : CircleAvatar(
                      minRadius: 15.0,
                      maxRadius: 15.0,
                      backgroundImage: NetworkImage(
                          'https://www.pngitem.com/pimgs/m/118-1181708_google-icon-google-logo-design-flaws-hd-png.png'),
                    ),
              Text(
                text,
                style: TextStyle(
                    color: color, fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ));
  }

  void submit() async {
    if (!formKey!.currentState!.validate()) {
    } else {
      bool _valid = await saveData();
      if (_valid == true) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return BottomNavBar();
        }));
      }
    }
  }

  Future<bool> saveData() async {
    try {
      SharedPreferences _user = await SharedPreferences.getInstance();
      _user.setString('email', emailController!.text);
      return true;
    } catch (e) {
      return false;
    }
  }
}

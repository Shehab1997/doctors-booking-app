import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool x = true;
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              textField(emailKey, emailController, 'Email Address',
                  TextInputType.emailAddress),
              textField(
                passwordKey,
                passwordController,
                'Password',
                TextInputType.visiblePassword,
              ),
              flatBtn('Forget Password?'),
              button('Login', Colors.white),
              button("  Continue with Google", Colors.grey),
              SizedBox(
                height: 50,
              ),
              flatBtn("Not an existing user?"),
            ],
          ),
        ),
      ),
    );
  }

  flatBtn(String flat) {
    return Align(
        alignment: flat == "Forget Password?"
            ? Alignment.bottomRight
            : Alignment.bottomCenter,
        child: flat == "Forget Password?"
            ? TextButton(onPressed: null, child: Text(flat))
            : TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  flat,
                  style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )));
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

  textField(
      Key id, TextEditingController control, String label, TextInputType type,
      {bool disappear = false}) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        key: id,
        decoration: InputDecoration(
            labelText: label,
            suffixIcon: label == 'Password'
                ? InkWell(
                    child: Icon(Icons.remove_red_eye_outlined),
                    onTap: () {
                      setState(() {
                        x = !x;
                      });
                    },
                  )
                : null),
        keyboardType: type,
        controller: control,
        obscureText: label == 'Password' ? x : disappear,
        validator: label == "Email Address"
            ? (value) {
                if (value.isEmpty || !value.contains("@")) {
                  return "invalid email";
                }
                return null;
              }
            : (value) {
                if (value.length < 6 || value.isEmpty) {
                  return "Password incorrect";
                }
                return null;
              },
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

  void submit() {
    if (!formKey.currentState.validate()) {
      return null;
    }
  }
}

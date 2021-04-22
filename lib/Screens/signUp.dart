import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Models/auth.dart';
import 'package:flutter_app_itshare/Widgets/hiThere.dart';
import 'package:flutter_app_itshare/Widgets/textField.dart';
import 'package:flutter_app_itshare/Widgets/flatBtn.dart';
import 'package:flutter_app_itshare/Widgets//signBtns.dart';
import 'package:provider/provider.dart';

import 'bottomnavbar.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState>? mobileKey = GlobalKey<FormState>();
  GlobalKey<FormState>? nameKey = GlobalKey<FormState>();
  TextEditingController? mobileController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
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
              TopItems('SignUp'),
              TextFieldCus(
                  nameKey!, nameController!, 'Your Name', TextInputType.name),
              TextFieldCus(emailKey!, emailController!, 'Email Address',
                  TextInputType.emailAddress),
              TextFieldCus(mobileKey!, mobileController!, 'Mobile Number',
                  TextInputType.phone),
              TextFieldCus(passwordKey!, passwordController!, 'Password',
                  TextInputType.visiblePassword),
              FlatBtn('Forget Password?'),
              FlatBtn('Accept Terms & Conditions'),
              //el function btsht8l 3la tul abl ma aktb ay haga mogrd lma bd5ol el signup abl ma ados create
              SignBtn("Create account",Colors.white,s:emailController!,d: passwordController!),
              SignBtn("  Sign up with Google",Colors.grey,s:emailController!,d: passwordController!),
              FlatBtn('Have an account?')
            ],
          ),
        ),
      ),
    );
  }
  //   submit() async{
  //   if (await !formKey!.currentState!.validate()) {
  //   } else {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
  //         return BottomNavBar();
  //       }));
  //   }
  // }



}

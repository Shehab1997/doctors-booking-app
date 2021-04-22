import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

Future<void> _authenticate (String email , String password, String urlSegment)async{

   final url ="https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDCbkmUVNxHj6qiZLdE8FZFDr2Obx7koyE";
  try{
    final res=await http.post(Uri.parse(url),body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken': true
    }));
    
print(jsonDecode(res.body));
  }
  catch(e){
    print(e) ;
  }

}

Future<void> login (String email , String password)async{
  return _authenticate(email,password,'signInWithPassword');
}
Future<void> signUp (String email , String password)async{
  print(email);
  return _authenticate(email,password,'signUp');

}
}
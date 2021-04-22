import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecondProvider with ChangeNotifier {
bool pass=true;
  hidePass(){
    pass=!pass;
    notifyListeners();
  }

}

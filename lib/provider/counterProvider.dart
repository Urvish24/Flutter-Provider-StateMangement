



import 'package:flutter/material.dart';

class counterProvider extends ChangeNotifier {
  int counter = 0;

  incrementCounter(){
    counter++;
    notifyListeners();
  }

  decncrementCounter(){
    if(counter > 0){
      counter--;
      notifyListeners();
    }
  }

  resetCounter(){
    counter = 0;
    notifyListeners();
  }

}

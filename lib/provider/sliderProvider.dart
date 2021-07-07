import 'package:flutter/material.dart';

class sliderProvider extends ChangeNotifier{
  double value = 0;


  sliderChange(tempvalue){
    value = tempvalue;
    notifyListeners();
  }

  double get getSlidervalue => value;

}
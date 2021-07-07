

 import 'package:flutter/material.dart';

class notifiedProvider extends ChangeNotifier{

  List notificationList = [];

  notificationAdd(String notifystr){
    notificationList.add(notifystr);
    notifyListeners();
  }

 }
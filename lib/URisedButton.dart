 import 'package:flutter/material.dart';

import './constant/constants.dart';

class URisedButton extends StatelessWidget {
  String title;
  GestureTapCallback onTap;

  URisedButton({this.title, this.onTap});

  @override
   Widget build(BuildContext context) {
     return  Container(
       margin: EdgeInsets.all(10),
       child: SizedBox(
         width: double.infinity,
         child: RaisedButton(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0),
               //side: BorderSide(color: Colors.red)
           ),
          splashColor: Colors.white.withOpacity(0.5),
           color: Theme.of(context).primaryColor,
           child: Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text(title,style: button_style)),
           onPressed: onTap,
         ),
       ),
     );
   }
 }

import 'package:flutter/material.dart';
import 'package:myapp/HomePage.dart';
import 'package:myapp/provider/counterProvider.dart';
import 'package:myapp/provider/sliderProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<counterProvider>(
          create: (_) => counterProvider(),
        ),
        ChangeNotifierProvider<sliderProvider>(
          create: (_) => sliderProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

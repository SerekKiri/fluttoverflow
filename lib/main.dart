import 'package:flutter/material.dart';
import 'package:fluttoverflow/screens/screens.dart';
import 'package:fluttoverflow/theme/default.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StackExchange',
      theme: Themes.stackTheme(),
      home: MainScreen(),
    );
  }
}
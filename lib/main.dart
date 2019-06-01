import 'package:flutter/material.dart';
import 'package:fluttoverflow/screens/screens.dart';
import 'package:fluttoverflow/screens/site_provider.dart';
import 'package:fluttoverflow/theme/default.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SiteProvider>(
      builder: (context) => SiteProvider(),
      child: MaterialApp(
      title: 'StackExchange',
      theme: Themes.stackTheme(),
      home: MainScreen()),
    );
  }
}
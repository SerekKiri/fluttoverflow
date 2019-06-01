import 'package:flutter/material.dart';
import 'package:fluttoverflow/screens/questions.dart';
import 'package:fluttoverflow/screens/screens.dart';
import '../theme/theme.dart';

import 'dart:async';

/// Main screen of the application; Holds bottom navigation bar
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  /// Index of currently selected screen
  int _currentScreenIndex = 1;

  /// Screens that can be switched with bottomnavbar
  final List<Widget> _children = [
    QuestionsScreen(),
    QuestionsScreen(),
    QuestionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _children[_currentScreenIndex],
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  /// Switches screen to screen at given index
  ///
  /// [index] index of screen to switch to
  void _onItemTapped(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  /// Builds a custom bottom app bar
  Widget _buildBottomAppBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2.0,
          ),
        ],
        color: Themes.stackTheme().primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildIconButton(Icons.home, 1, "Home"),
          _buildIconButton(Icons.notifications, 0, "Notifications"),
          _buildIconButton(Icons.account_circle, 2, "Profile"),
        ],
      ),
    );
  }



  Widget _buildIconButton(IconData icon, num index, String title) {
    var buttonColor = _currentScreenIndex == index
        ? Themes.stackTheme().accentColor
        : Theme.of(context).iconTheme.color.withOpacity(0.40);
    return Expanded(
      child: SafeArea(
        child: FlatButton(
          onPressed: () => _onItemTapped(index),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    icon,
                    size: 24,
                    color: buttonColor,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: buttonColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

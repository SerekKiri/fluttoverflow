import 'package:flutter/material.dart';
import '../theme/theme.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _BottomBar();
  }
}

class _BottomBar extends State<Home> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // key: ,
      // body: ,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Themes.stackTheme().backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _iconButton(Icons.home, 0, "Home"),
            _iconButton(Icons.notifications, 0, ""),
            _addNewButton(),
            _iconButton(Icons.mail, 0, "Chat"),
            _iconButton(Icons.account_circle, 3, "Profile", badge: 0),
          ],
        ),
      ),
    );
  }

   Widget _addNewButton() {
    return Container(
      width: 34.0,
      height: 34.0,
      child: FloatingActionButton(
        child: Icon(
          Icons.create,
          size: 20.0,
        ),
        tooltip: "Add",
        foregroundColor: Themes.stackTheme().primaryColor,
        backgroundColor: Themes.stackTheme().accentColor,
        elevation: 0.0,
        onPressed: () {
        },
      ),
    );
  }

  Widget _iconAddNewButton(
      IconData icon, String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            elevation: 1.0,
            highlightElevation: 8.0,
            onPressed: onPressed,
            child: Icon(icon),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

 Widget _iconButton(IconData icon, num index, String tooltip,
      {num badge = 0}) {
    return IconButton(
      icon: Stack(
        children: <Widget>[
          Icon(
            icon,
            size: 26.0,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: badge != 0
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 3.0,
                    ),
                    child: Text(
                      badge.toString(),
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}


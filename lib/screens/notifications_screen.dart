import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('You have zero notifications')
      ),
    );
  }
}
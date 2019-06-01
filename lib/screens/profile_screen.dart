import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/user_profile.dart';
import 'package:fluttoverflow/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: FutureLoader<UserProfile>(
          future: api.users.getUser('6844962'),
          builder: (context, profile) => ListView(children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(profile.avatarUrl),
                      ),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(profile.displayName, style: TextStyle(fontSize: 15.0))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Row(
              children: [
                Text('Reputation: ' + profile.reputation.toString())
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ])
    ));
  }
}

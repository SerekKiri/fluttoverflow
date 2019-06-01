import 'package:flutter/material.dart';
import 'package:fluttoverflow/models/models.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}

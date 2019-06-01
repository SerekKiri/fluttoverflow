import 'package:flutter/material.dart';
import 'package:fluttoverflow/models/models.dart';

/// 🥖
class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(question.owner.profileImage),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Material(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            question.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            _iconText(Icons.comment, "14"),
                            _iconText(Icons.arrow_upward, "14"),
                            _iconText(Icons.date_range, "3 minutes"),
                          ],
                        ),
                        /*Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Asked 3 minutes ago, 13 comments',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),),*/
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
            size: 16,
          ),
          Text(
            ' $text',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            softWrap: false,
            overflow: TextOverflow.fade,
          )
        ],
      ),
    );
  }
}

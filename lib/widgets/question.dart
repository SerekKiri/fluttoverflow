import 'package:flutter/material.dart';
import 'package:fluttoverflow/models/models.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:fluttoverflow/screens/screens.dart';

/// 🥖
class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget({this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                QuestionScreen(id: question.id, title: question.title)));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: question.owner.displayName,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: ' asked ' +
                                    timeago.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            question.creationDate * 1000)),
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              )
                            ]),
                          )),
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
                          _iconText(
                              Icons.comment, question.answerCount.toString()),
                          _iconText(Icons.question_answer, "14"),
                          Expanded(
                            child: Text(
                              "in " + question.tags.join(", "),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ]),
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

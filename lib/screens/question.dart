import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/models.dart';
import 'package:fluttoverflow/widgets/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html_unescape/html_unescape.dart';

class QuestionScreen extends StatefulWidget {
  final int id;
  final String title;

  const QuestionScreen({ this.id, this.title  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}
class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureLoader<Question>(
        future: api.questions.getQuestion(widget.id),
        builder: (context, data) {
          return Container(
            child: ListView(children: [
              Expanded(child: Markdown(data: HtmlUnescape().convert(data.bodyMarkdown))),
              ...data.answers.map((answer) {
                return Expanded(child: Markdown(data: HtmlUnescape().convert(answer.bodyMarkdown)));
              })
            ]),
          );
        },
      ),
    );
  }
}
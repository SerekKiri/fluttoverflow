import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/models.dart';
import 'package:fluttoverflow/widgets/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
          return Column(children: [
            Markdown(data: data.bodyMarkdown)
          ]);
        },
      ),
    );
  }
}
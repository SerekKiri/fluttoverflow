import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/models.dart';
import 'package:fluttoverflow/screens/site_provider.dart';
import 'package:fluttoverflow/widgets/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<SiteProvider>(
        builder: (context, model, _) => FutureLoader<Question>(
          future: api.questions.getQuestion(widget.id, model.currentSite),
          builder: (context, data) {
            return Container(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MarkdownBody(data: HtmlUnescape().convert(data.bodyMarkdown)),
                    ),
                  ),
                ),
                ...data.answers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.only( left: 40.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                                          color: Theme.of(context).cardColor,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MarkdownBody(data: HtmlUnescape().convert(answer.bodyMarkdown)),
                        ),
                      ),
                    ),
                  );
                })
              ]),
            );
          },
        ),
      ),
    );
  }
}
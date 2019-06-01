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
      appBar: AppBar(title: Text('Question')),
      body: Consumer<SiteProvider>(
        builder: (context, model, _) => FutureLoader<Question>(
          future: api.questions.getQuestion(widget.id, model.currentSite),
          builder: (context, data) {
            return Container(
              child: ListView(children: [
                drawQuestion(context, data),
                ...data.answers.map((answer) {
                  return drawAnswer(context, answer);
                })
              ]),
            );
          },
        ),
      ),
    );
  }


  Widget drawQuestion(BuildContext context, Question question) {

    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: drawHeader(context, question.owner),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(question.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: false, overflow: TextOverflow.ellipsis,)),
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MarkdownBody(data: HtmlUnescape().convert(question.bodyMarkdown)),
                      )]),
                    ),
                  ),
                );
  }

    Widget drawAnswer(BuildContext context, Answer answer) {

    return Padding(
                  padding: const EdgeInsets.only(left: 48.0, top: 8, right: 8, bottom: 8),
                  child: Material(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        drawHeader(context, answer.owner),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MarkdownBody(data: HtmlUnescape().convert(answer.bodyMarkdown)
                      ),
                        )]),
                    ),
                  ),
                );
  }

  Widget drawHeader(BuildContext context, ShallowUser user) {
    return Row(children: <Widget>[
      Padding(
              padding: const EdgeInsets.only(bottom: 4.0, right: 6.0),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.profileImage),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(' ' + user.displayName, style: TextStyle(fontSize: 18))
            ),      
    ],);
  }
}
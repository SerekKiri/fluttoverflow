import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/widgets/widgets.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var searching = false;
  var tag;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: _buildTopAppBar(),
            body: searching
                ? Center(child: Text('Search for a tag'))
                : Column(
                    children: [
                      tag != null ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tag = null;
                            });
                          },
                          child: Text("Showing results for tag \"" + tag + "\"", style: TextStyle(fontSize: 18)))) : Container(),
                      
                      Expanded(
                        child: TabBarView(children: [
                          QuestionsList(QuestionSort.HOT, tag),
                          QuestionsList(QuestionSort.ACTIVITY, tag),
                          QuestionsList(QuestionSort.CREATION, tag),
                          QuestionsList(QuestionSort.WEEK, tag),
                          QuestionsList(QuestionSort.MONTH, tag),
                        ]),
                      )
                    ],
                  )));
  }

  Widget _buildTopAppBar() {
    return searching
        ? SearchAppbarWidget(
            onClosedSearch: () {
              setState(() {
                searching = false;
              });
            },
            searchCallback: (q, _) {
              print(q);
              setState(() {
                searching = false;
                tag = q;
              });
            },
          )
        : AppbarTabsWidget(
            onPressedSearch: () {
              setState(() {
                searching = true;
              });
            },
            tabs: <Widget>[
              Tab(text: 'Hot'),
              Tab(text: 'Activity'),
              Tab(text: 'Creation'),
              Tab(text: 'Week'),
              Tab(text: 'Month'),
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/widgets/widgets.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: _buildTopAppBar(),
          body: TabBarView(children: [
            QuestionsList(QuestionSort.HOT),
            QuestionsList(QuestionSort.ACTIVITY),
            QuestionsList(QuestionSort.CREATION),
            QuestionsList(QuestionSort.WEEK),
            QuestionsList(QuestionSort.MONTH),
          ])
        )
      );
  }

  Widget _buildTopAppBar() {
    return AppbarTabsWidget(
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

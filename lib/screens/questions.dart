import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/models/question.dart';
import 'package:fluttoverflow/widgets/widgets.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  Widget getListWithSort (QuestionSort sortType) {
    return Container(
      child: Center(
        child: FutureLoader<List<Question>>(
          future: api.questions
              .getQuestions(sortType: QuestionSort.ACTIVITY),
          builder: (context, data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  QuestionWidget(question: data[index]),
            ); // @TODO UNDUPA
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: _buildTopAppBar(),
            body: TabBarView(children: [
              getListWithSort(QuestionSort.HOT),
              getListWithSort(QuestionSort.ACTIVITY),
              getListWithSort(QuestionSort.CREATION),
              getListWithSort(QuestionSort.WEEK),
              getListWithSort(QuestionSort.MONTH),
            ])));
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

import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/models/question.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder<List<Question>>(
            future: api.questions.getQuestions(sortType: QuestionSort.ACTIVITY),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text('Waiting to start'));
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => Text(snapshot.data[index].title),
                  ); // @TODO UNDUPA
              }
            }),
      ),
    );
  }
}

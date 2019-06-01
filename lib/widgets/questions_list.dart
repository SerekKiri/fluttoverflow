import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/models/models.dart';
import 'package:fluttoverflow/widgets/widgets.dart';

class QuestionsList extends StatelessWidget {
  final QuestionSort sortType;

  const QuestionsList(this.sortType, { key });

  @override
  Widget build(BuildContext context) {    
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
}
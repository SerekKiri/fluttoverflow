import 'package:flutter/material.dart';
import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/models/models.dart';
import 'package:fluttoverflow/screens/site_provider.dart';
import 'package:fluttoverflow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class QuestionsList extends StatelessWidget {
  final QuestionSort sortType;

  const QuestionsList(this.sortType, { key });

  @override
  Widget build(BuildContext context) {    
    return Container(
      child: Consumer<SiteProvider>(
        builder: (context, model, _) => Center(
          child: FutureLoader<List<Question>>(
            future: api.questions
                .getQuestions(sortType: sortType, site: model.currentSite),
            builder: (context, data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    QuestionWidget(question: data[index]),
              ); // @TODO UNDUPA
            },
          ),
        )
      ),
    );
  }
}
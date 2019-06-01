import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/models.dart';
import 'dart:convert';

enum QuestionSort {
  WEEK,
  MONTH,
  CREATION,
  ACTIVITY,
  HOT,
}

class QuestionsApi extends ApiEndpoint {
  const QuestionsApi(client) : super(client);

  Future<List<Question>> getQuestions({
    QuestionSort sortType = QuestionSort.ACTIVITY,
    int count = 25,
  }) async {
    var sort = '';
    switch (sortType) {
      case QuestionSort.WEEK: sort = 'week'; break;
      case QuestionSort.MONTH: sort = 'month'; break;
      case QuestionSort.CREATION: sort = 'creation'; break;
      case QuestionSort.ACTIVITY: sort = 'activity'; break;
      case QuestionSort.HOT: sort = 'hot'; break;
    }
    var response = await client.getRequest(
      '/questions',
      site: 'stackoverflow',
      urlEncoded: {
        'sort': sort
      }
    );
    print(response);
    var questions = json.decode(response)["items"].map((dupa) => Question.fromJson(dupa));
    print (questions);
    return List<Question>.from(questions);
  }

  Future<Question> getQuestion(int id) async {
    var response = await client.getRequest(
      '/questions/$id',
      site: 'stackoverflow',
      filter: '!-*jbN-lCC5Q4'
    );
    print(response);
    return Question.fromJson(json.decode(response));
  }
}

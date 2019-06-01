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
    var response = await client.getRequest('/questions', site: 'stackoverflow');
    print(response);
    var questions = json.decode(response)["items"].map((dupa) => Question.fromJson(dupa));
    print (questions);
    return List<Question>.from(questions);
  }

  Future<Question> getQuestion(int id) async {
    var response = await client.getRequest(
      '/questions/$id',
      site: 'stackoverflow',
      filter: '!b1MMEU*.FpU0zn'
    );
    print(response);
    return Question.fromJson(json.decode(response));
  }
}

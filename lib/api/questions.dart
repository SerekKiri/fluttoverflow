import 'package:fluttoverflow/api/api.dart';

class Question {
  final String body;
  const Question({this.body});
}

enum QuestionSort {
  WEEK,
  MONTH,
  CREATION,
  ACTIVITY,
  HOT,
}

class QuestionsApi extends ApiEndpoint {
  const QuestionsApi(client) : super(client);

  Future<List<Question>> getQuestions({QuestionSort sortType = QuestionSort.ACTIVITY, int count, }) async {
    var response = await client.getRequest('/questions', urlEncoded: {
      'site': 'stackoverflow',
    });
    print(response);
  }
}

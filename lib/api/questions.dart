import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/models.dart';
import 'dart:convert';

import 'package:fluttoverflow/screens/site_provider.dart';

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
    String tagged,
    StackExchangeSite site,
  }) async {
    var sort = '';
    switch (sortType) {
      case QuestionSort.WEEK:
        sort = 'week';
        break;
      case QuestionSort.MONTH:
        sort = 'month';
        break;
      case QuestionSort.CREATION:
        sort = 'creation';
        break;
      case QuestionSort.ACTIVITY:
        sort = 'activity';
        break;
      case QuestionSort.HOT:
        sort = 'hot';
        break;
    }
    print(sort);
    var response;
    if (tagged != null) {
      response =
          await client.getRequest('/search', site: site.url, urlEncoded: {
        'sort': sort,
        'tagged': tagged,
        'site': site.url,
      });
    } else {
      response =
          await client.getRequest('/questions', site: site.url, urlEncoded: {
        'sort': sort,
        'site': site.url,
      });
    }

    var questions =
        json.decode(response)["items"].map((dupa) => Question.fromJson(dupa));
    print(questions);
    return List<Question>.from(questions);
  }

  Future<Question> getQuestion(int id) async {
    var response = await client.getRequest('/questions/$id',
        site: 'stackoverflow', filter: '!b1MMEU*.-3EcYn');
    print(response);
    return Question.fromJson(json.decode(response));
  }
}

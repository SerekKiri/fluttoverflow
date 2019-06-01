import 'package:fluttoverflow/api/questions.dart';
import 'package:http/http.dart' as http;

class ExchangeApiClient {
  static const HOST = "api.stackexchange.com";
  const ExchangeApiClient();

  // Makes a basic HTTP request to api stack exchange
  Future<String> getRequest(
    String endpoint,
    {
      String site = 'stackoverflow',
      String filter = '',
      Map<String, String> urlEncoded,
    }
  ) async {
    var newUrlEncoded = {
      'site': site,
      'filter': filter
    };
    final uri = new Uri.https(HOST, '/2.2$endpoint', urlEncoded ?? newUrlEncoded); // 🥖
    var response = await http.get(uri);
    var body = response.body;
    return body;
  }
}

abstract class ApiEndpoint {
  final ExchangeApiClient client;
  const ApiEndpoint(this.client);
}


class ExchangeApi {
  ExchangeApiClient _client = ExchangeApiClient();
  QuestionsApi questions;
  
  
  ExchangeApi() {
    questions = QuestionsApi(_client);
  }

  init() {

  }
}


var api = ExchangeApi();

import 'package:fluttoverflow/api/questions.dart';
import 'package:http/http.dart' as http;

class ExchangeApiClient {
  static const HOST = "api.stackexchange.com";
  const ExchangeApiClient();

  // Makes a basic HTTP request to api stack exchange
  Future<String> getRequest(
    String endpoint, {
    Map<String, String> urlEncoded = const {},
  }) async {
    final uri = new Uri.https(HOST, '/2.2$endpoint', urlEncoded); // 🥖
    var response = await http.get(uri);
    var bodyd = response.body;
    return bodyd;
  }
}

abstract class ApiEndpoint {
  final ExchangeApiClient client;
  const ApiEndpoint(this.client);
}


class ExchangeApi {
  ExchangeApiClient _client = ExchangeApiClient();
  ApiEndpoint questions;
  
  
  ExchangeApi() {
    questions = QuestionsApi(_client);
  }

  init() {

  }
}


var api = ExchangeApi();

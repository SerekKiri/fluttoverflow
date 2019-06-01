import 'package:fluttoverflow/api/questions.dart';
import 'package:fluttoverflow/api/users.dart';
import 'package:fluttoverflow/key.dart';
import 'package:fluttoverflow/screens/site_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExchangeApiClient {
  static const HOST = "api.stackexchange.com";
  const ExchangeApiClient();

  // Makes a basic HTTP request to api stack exchange
  Future<String> getRequest(
    String endpoint,
    {
      String site,
      String filter,
      Map<String, String> urlEncoded,
    }
  ) async {
    var newUrlEncoded = {
      'site': site,
      'filter': filter,
      'key': key,
    };
    if (urlEncoded != null) {
      urlEncoded['site'] = site;
      urlEncoded['filter'] = filter;
      urlEncoded['key'] = key; 
    }
    final uri = new Uri.https(HOST, '/2.2$endpoint', urlEncoded ?? newUrlEncoded); // 🥖
    print(uri);
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
  UsersApi users;
  
  
  ExchangeApi() {
    questions = QuestionsApi(_client);
    users = UsersApi(_client);
  }

  init() {

  }

  Future<List<StackExchangeSite>> getSites() async {
    var response = await _client.getRequest('/sites');
    print(response);
    var sitess = json.decode(response)["items"].map((e) => StackExchangeSite(e["api_site_parameter"], e["name"], e["icon_url"]));
    return List<StackExchangeSite>.from(sitess);
  }
}


var api = ExchangeApi();

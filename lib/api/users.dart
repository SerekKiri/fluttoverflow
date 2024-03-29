import 'package:fluttoverflow/api/api.dart';
import 'package:fluttoverflow/models/user_profile.dart';
import 'dart:convert';

class UsersApi extends ApiEndpoint {
  const UsersApi(client) : super(client);

  Future<UserProfile> getUser (String id) async {
    var response = await client.getRequest(
      '/users/$id',
      site: 'stackoverflow'
    );
    print(response);
    var profiles = json.decode(response)["items"].map((dupa) => UserProfile.fromJson(dupa));
    print(profiles);
    return List<UserProfile>.from(profiles)[0];
  }
}
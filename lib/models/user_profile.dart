import 'package:fluttoverflow/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  @JsonKey(name: 'profile_image', )
    final String avatarUrl;

  @JsonKey(name: 'display_name')
    final String displayName;

  @JsonKey(name: 'badge_counts')
    final List badgeCounts;

  @JsonKey(name: 'reputation')
    final int reputation;

  @JsonKey(name: 'location')
    final String location;

  @JsonKey(name: 'user_id')
    final int user_id;
  UserProfile({this.avatarUrl, this.displayName, this.badgeCounts, this.reputation, this.location, this.user_id });
}
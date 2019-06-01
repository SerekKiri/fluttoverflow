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
    final int userId;
 
  UserProfile({this.avatarUrl, this.displayName, this.badgeCounts, this.reputation, this.location, this.userId });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
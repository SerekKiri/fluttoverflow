import 'package:fluttoverflow/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  @JsonKey(name: 'body_markdown', nullable: true, defaultValue: "")
  final String bodyMarkdown;

  @JsonKey(name: 'score')
  final int score;

  @JsonKey(name: 'owner')
  final ShallowUser owner;

  @JsonKey(name: 'answer_id')
  final int id;

  Answer(this.bodyMarkdown, this.score, this.id, this.owner);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
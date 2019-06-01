import 'package:fluttoverflow/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  @JsonKey(name: 'body_markdown', nullable: true, defaultValue: "")
  final String bodyMarkdown;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'tags')
  final List<String> tags;

  @JsonKey(name: 'score')
  final int score;

  @JsonKey(name: 'owner')
  final ShallowUser owner;

  @JsonKey(name: 'answers')
  final List<Answer> answers;

  @JsonKey(name: 'question_id')
  final int id;

  Question(this.bodyMarkdown, this.title, this.tags, this.score, this.id, this.owner, this.answers);

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
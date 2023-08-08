import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
class Resume with _$Resume {
  const factory Resume({
    String? languageCode,
    String? language,
    String? url,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);
}

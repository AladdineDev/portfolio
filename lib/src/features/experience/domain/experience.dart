import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    String? job,
    String? company,
    String? description,
    bool? isPresent,
    int? startYear,
    int? endYear,
    int? startMonth,
    int? endMonth,
    String? url,
    List<String>? technologies,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

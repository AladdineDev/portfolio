import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/shared/domain/link.dart';

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
    List<Link>? links,
    List<String>? technologies,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

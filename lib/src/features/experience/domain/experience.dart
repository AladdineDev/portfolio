import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/common/domain/link.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    String? job,
    String? company,
    String? description,
    String? url,
    bool? isPresent,
    int? startYear,
    int? startMonth,
    int? endYear,
    int? endMonth,
    List<String>? technologies,
    List<Link>? links,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

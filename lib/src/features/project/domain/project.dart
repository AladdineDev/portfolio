import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/shared/domain/link.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    String? title,
    String? description,
    List<String>? technologies,
    String? url,
    String? iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
    String? screenshotUrl,
    List<Link>? links,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/common/domain/link.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    String? name,
    String? description,
    String? url,
    String? iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
    String? screenshotPath,
    List<String>? technologies,
    List<Link>? links,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

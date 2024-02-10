import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/common/domain/icon.dart';

part 'technology.freezed.dart';
part 'technology.g.dart';

@freezed
class Technology with _$Technology {
  const factory Technology({
    String? name,
    IconModel? icon,
  }) = _Technology;

  factory Technology.fromJson(Map<String, dynamic> json) =>
      _$TechnologyFromJson(json);
}

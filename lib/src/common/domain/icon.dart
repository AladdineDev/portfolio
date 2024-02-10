import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon.freezed.dart';
part 'icon.g.dart';

@freezed
class IconModel with _$IconModel {
  const factory IconModel({
    String? iconAssetName,
    String? iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
    String? color,
  }) = _IconModel;

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);
}

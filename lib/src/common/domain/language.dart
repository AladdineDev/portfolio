import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/common/domain/icon.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class Language with _$Language {
  const factory Language({
    String? code,
    String? name,
    String? nativeName,
    IconModel? icon,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

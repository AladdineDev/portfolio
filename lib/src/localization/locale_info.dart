import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_info.freezed.dart';
part 'locale_info.g.dart';

@freezed
class LocaleInfo with _$LocaleInfo {
  const factory LocaleInfo({
    String? languageCode,
    String? languageName,
  }) = _LocaleInfo;

  factory LocaleInfo.fromJson(Map<String, dynamic> json) =>
      _$LocaleInfoFromJson(json);
}

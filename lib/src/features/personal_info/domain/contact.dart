import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/src/common/domain/icon.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    String? tooltip,
    String? url,
    IconModel? icon,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

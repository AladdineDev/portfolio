import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/personal_info/presentation/widgets/contact_icon_button.dart';
import 'package:portfolio/src/features/personal_info/domain/contact.dart';

class ContactBar extends ConsumerWidget {
  const ContactBar({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: contacts.map((contact) {
        return ContactIconButton(contact: contact);
      }).toList(),
    );
  }
}

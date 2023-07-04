import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/features/introduction/domain/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactBar extends ConsumerWidget {
  const ContactBar({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: contacts.map((contact) {
        return IconButton(
          tooltip: contact.tooltip,
          onPressed: () async {
            if (!await launchUrl(Uri.parse(contact.url))) {
              final snackBar = SnackBar(
                content: Text("Could not launch ${contact.url}"),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          icon: Icon(contact.icon),
          padding: _fixGithubIconPadding(contact.icon),
        );
      }).toList(),
    );
  }

  EdgeInsetsGeometry? _fixGithubIconPadding(IconData iconData) {
    if (iconData != FontAwesomeIcons.discord) return null;
    return const EdgeInsets.only(right: 6);
  }
}

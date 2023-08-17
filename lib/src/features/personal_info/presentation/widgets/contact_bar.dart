import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/features/personal_info/domain/contact.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactBar extends ConsumerWidget {
  const ContactBar({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: contacts.map((contact) {
        final iconData = _getIconData(contact);
        final contactTooltip = contact.tooltip;
        final contactUrl = contact.url;
        if (contactTooltip == null || contactUrl == null) {
          return const SizedBox.shrink();
        }
        return IconButton(
          tooltip: contact.tooltip,
          onPressed: () async {
            if (!await launchUrl(Uri.parse(contactUrl))) {
              if (context.mounted) {
                final snackBar = SnackBar(
                  content: Text(
                    "${tr(LocaleKeys.openUrlError)} $contactUrl",
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          icon: iconData != null
              ? Icon(iconData)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.link),
                    const SizedBox(width: 4),
                    Text(contactTooltip),
                  ],
                ),
          padding: iconData == null ? null : _fixGithubIconPadding(iconData),
        );
      }).toList(),
    );
  }

  IconData? _getIconData(Contact contact) {
    final contactIconCodePoint = contact.iconCodePoint;
    final contactIconFontFamily = contact.iconFontFamily;
    final contactIconFontPackage = contact.iconFontPackage;
    if (contactIconCodePoint != null &&
        contactIconFontFamily != null &&
        contactIconFontPackage != null) {
      final contactIconCodePointHexa = int.tryParse(contactIconCodePoint);
      if (contactIconCodePointHexa != null) {
        final iconData = IconData(
          contactIconCodePointHexa,
          fontFamily: contactIconFontFamily,
          fontPackage: contactIconFontPackage,
        );
        return iconData;
      }
    }
    return null;
  }

  EdgeInsetsGeometry? _fixGithubIconPadding(IconData iconData) {
    if (iconData != FontAwesomeIcons.discord) return null;
    return const EdgeInsets.only(right: 6);
  }
}

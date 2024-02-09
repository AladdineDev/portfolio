import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/icon.dart';
import 'package:portfolio/src/features/personal_info/domain/contact.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';

class ContactIconButton extends ConsumerWidget {
  const ContactIconButton({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUrl = contact.url;
    final icon = _buildIcon(contact: contact);
    if (contactUrl == null || icon == null) {
      return const SizedBox.shrink();
    }
    return IconButton(
      tooltip: contact.tooltip,
      icon: icon,
      onPressed: () async {
        try {
          await LaunchUrlHelper.launchURL(contactUrl);
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessengerHelper.showLaunchUrlError(
              context,
              url: contactUrl,
            );
          }
        }
      },
    );
  }

  Widget? _buildIcon({required Contact contact}) {
    final contactTooltip = contact.tooltip;
    return MyIcon(
      icon: contact.icon,
      placeholder: contactTooltip == null
          ? const SizedBox.shrink()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.link),
                const SizedBox(width: 4),
                Text(contactTooltip),
              ],
            ),
    );
  }
}

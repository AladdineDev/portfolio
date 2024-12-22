import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/personal_info/domain/resume.dart';
import 'package:portfolio/src/features/personal_info/presentation/widgets/resume_language_dialog.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResumeButton extends ConsumerStatefulWidget {
  const ResumeButton({super.key, required this.resumes});

  final List<Resume> resumes;

  @override
  ConsumerState<ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends ConsumerState<ResumeButton> {
  bool _isHovered = false;
  void _hoverEffectOn() => setState(() => _isHovered = true);
  void _hoverEffectOff() => setState(() => _isHovered = false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => _hoverEffectOn(),
      onExit: (_) => _hoverEffectOff(),
      child: GestureDetector(
        onLongPress: _hoverEffectOn,
        onLongPressUp: _hoverEffectOff,
        child: SelectionContainer.disabled(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: _isHovered
                  ? theme.colorScheme.tertiary.withValues(alpha: 0.1)
                  : null,
              side: BorderSide(
                width: _isHovered ? 2 : 1,
                color: theme.colorScheme.tertiary,
              ),
              elevation: 16,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
            ),
            onPressed: () => _onPressed(context, ref),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Icon(
                  const IconData(
                    0xeec7,
                    fontFamily: "FontAwesome",
                  ),
                  size: 24,
                  color: theme.colorScheme.inverseSurface,
                ),
                gapW12,
                Text(
                  tr(LocaleKeys.resume),
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    if (widget.resumes.length > 1) {
      showAdaptiveDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => ResumeLanguageDialog(resumes: widget.resumes),
      );
    } else if (widget.resumes.length == 1) {
      final resumeFirstUrl = widget.resumes.first.url;
      if (resumeFirstUrl == null) {
        ScaffoldMessengerHelper.showLaunchUrlError(context);
      } else {
        try {
          await LaunchUrlHelper.launchURL(resumeFirstUrl);
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessengerHelper.showLaunchUrlError(
              context,
              url: resumeFirstUrl,
            );
          }
        }
      }
    } else {
      ScaffoldMessengerHelper.showLaunchUrlError(context);
    }
  }
}

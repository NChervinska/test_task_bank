import 'package:flutter/material.dart';
import 'package:test_task_bank/l10n/generated/test_task_app_localizations.dart';
import 'package:test_task_bank/utils/build_context_ext.dart';

class LanguageDialog extends StatelessWidget {
  final ValueSetter<Locale> onSelect;

  const LanguageDialog({
    super.key,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.isWeb ? context.width / 3 : 60,
        vertical: 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            context.strings.selectLanguage,
            style: context.theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          ...TestTaskAppLocalizations.supportedLocales.map((locale) {
            return GestureDetector(
              onTap: () => onSelect(locale),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  context.getLocaleLocalizations(locale).currentLanguage,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

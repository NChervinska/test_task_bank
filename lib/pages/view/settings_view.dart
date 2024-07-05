import 'package:flutter/material.dart';
import 'package:test_task_bank/utils/build_context_ext.dart';

class SettingsView extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Widget? child;

  const SettingsView({
    super.key,
    required this.onTap,
    required this.title,
    this.child,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final subText = subtitle;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: context.isWeb ? context.width / 2 : double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            Text(title, style: context.theme.textTheme.bodyLarge),
            const SizedBox(width: 8),
            if (subText != null) ...[
              Expanded(
                child: Text(
                  subText,
                  style: context.theme.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 8),
            ] else
              const Spacer(),
            if (child != null)
              child!
            else
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.theme.colorScheme.secondary,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/app_colors.dart';

class ProfileSectionWidget extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showTrailing;

  const ProfileSectionWidget({
    Key? key,
    this.icon,
    this.iconWidget,
    required this.title,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.showTrailing = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Widget displayedIcon = iconWidget ??
        Icon(
          icon ?? Icons.help_outline,
          color: iconColor ?? colorScheme.primary,
          size: 20,
        );

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryBackgroundColor(isDark),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor ?? colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: displayedIcon,
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 16),
        ),
        trailing: showTrailing
            ? Icon(
                Icons.chevron_right,
                color: colorScheme.onBackground.withOpacity(0.6),
              )
            : null,
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}

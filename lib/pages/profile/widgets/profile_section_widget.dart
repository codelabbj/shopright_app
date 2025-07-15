import 'package:flutter/material.dart';

class ProfileSectionWidget extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showTrailing; // <-- ajout de la variable

  const ProfileSectionWidget({
    Key? key,
    this.icon,
    this.iconWidget,
    required this.title,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.showTrailing = true, // <-- true par défaut
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget displayedIcon = iconWidget ??
        Icon(
          icon ?? Icons.help_outline,
          color: iconColor ?? Colors.black87,
          size: 20,
        );

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: displayedIcon,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
        ),
        trailing: showTrailing
            ? const Icon(
                Icons.chevron_right,
                color: Colors.black54,
              )
            : null,
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}

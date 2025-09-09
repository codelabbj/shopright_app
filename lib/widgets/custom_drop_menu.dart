import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomDropdownField extends StatelessWidget {
  final String? label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownField({
    Key? key,
    this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
            ),
          DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            dropdownColor: isDark ? Colors.grey[850] : Colors.white, // ✅ fond du menu déroulant
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isDark ? Colors.white : Colors.black,
                ), // ✅ couleur du texte sélectionné
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                    ),
                  ),
                )
                .toList(),
            decoration: InputDecoration(
              filled: true,
              fillColor: isDark ? Color(0xFF1A2532) : Colors.white, // ✅ fond du champ
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
            ),
          ),
        ],
      ),
    );
  }
}

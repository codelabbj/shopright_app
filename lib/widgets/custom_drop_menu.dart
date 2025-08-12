import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey[300]!),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            items: items
                .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.labelSmall,
                    )))
                .toList(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
            ),
          )
        ],
      ),
    );
  }
}

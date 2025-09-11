import 'package:flutter/material.dart';

class SettingsLocalesWidget extends StatelessWidget {
  const SettingsLocalesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;

      if (width > 1024) {
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Locale', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: 'Select locale',
                  items: const [
                    DropdownMenuItem(value: 'Select locale', child: Text('Select locale')),
                    DropdownMenuItem(value: 'en', child: Text('en')),
                    DropdownMenuItem(value: 'vi', child: Text('vi')),
                    DropdownMenuItem(value: 'ar', child: Text('ar')),
                  ],
                  onChanged: (_) {},
                ),
                const SizedBox(height: 12),
                ElevatedButton(onPressed: () {}, child: const Text('Add new locale')),
              ]),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                _localeRow(context, 'العربية', 'ar', false),
                const Divider(),
                _localeRow(context, 'English', 'en', true),
                const Divider(),
                _localeRow(context, 'Tiếng Việt', 'vi', false),
              ]),
            ),
          )
        ]);
      } else {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Locale', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: 'Select locale',
                  items: const [
                    DropdownMenuItem(value: 'Select locale', child: Text('Select locale')),
                    DropdownMenuItem(value: 'en', child: Text('en')),
                    DropdownMenuItem(value: 'vi', child: Text('vi')),
                    DropdownMenuItem(value: 'ar', child: Text('ar')),
                  ],
                  onChanged: (_) {},
                ),
                const SizedBox(height: 12),
                ElevatedButton(onPressed: () {}, child: const Text('Add new locale')),
              ]),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                _localeRow(context, 'العربية', 'ar', false),
                const Divider(),
                _localeRow(context, 'English', 'en', true),
                const Divider(),
                _localeRow(context, 'Tiếng Việt', 'vi', false),
              ]),
            ),
          )
        ]);
      }
    });
  }

  Widget _localeRow(BuildContext context, String name, String code, bool isDefault) {
    final theme = Theme.of(context);
    return Row(children: [
      Expanded(child: Text(name, style: theme.textTheme.labelSmall)),
      SizedBox(width: 90, child: Text(code, style: theme.textTheme.displaySmall)),
      SizedBox(width: 90, child: Text(isDefault ? 'Yes' : 'No', style: theme.textTheme.displaySmall)),
      Row(children: const [
        _SmallBtn(color: Colors.blue, icon: Icons.download),
        SizedBox(width: 6),
        _SmallBtn(color: Colors.red, icon: Icons.delete),
      ])
    ]);
  }
}

class _SmallBtn extends StatelessWidget {
  final Color color;
  final IconData icon;
  const _SmallBtn({required this.color, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 28,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Icon(icon, size: 16, color: Colors.white),
    );
  }
}

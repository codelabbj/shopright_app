import 'package:flutter/material.dart';

class SettingsLanguagesWidget extends StatelessWidget {
  const SettingsLanguagesWidget({super.key});

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
                Row(children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      const Icon(Icons.info_outline, color: Colors.amber, size: 18),
                      const SizedBox(width: 8),
                      Text('You should set the default language only once during the initial setup and avoid changing it later.',
                          style: theme.textTheme.displaySmall!.copyWith(fontSize: 9)),
                    ]),
                  ),
                ]),
                const SizedBox(height: 16),
                _dropdownRow(context, 'Choose a language', ['Select language']),
                _textRow(context, 'Language name'),
                _dropdownRow(context, 'Locale', ['Select locale', 'en_US', 'fr_FR', 'ar_AR', 'vi_VN']),
                _dropdownRow(context, 'Language code', ['Select language code', 'en', 'fr', 'ar', 'vi']),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text('Text direction', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                ),
                Row(children: [
                  _radio(context, 'Left to right', true),
                  const SizedBox(width: 20),
                  _radio(context, 'Right to left', false),
                ]),
                _dropdownRow(context, 'Flag', ['Select a flag...']),
                _textRow(context, 'Order', initial: '0'),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Add new language')),
                ),
              ]),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _langRow(context, 'English', 'en', 'en_US', isDefault: true),
                const Divider(),
                _langRow(context, 'Tiếng Việt', 'vi', 'vi', isDefault: false),
                const Divider(),
                _langRow(context, 'Arabic', 'ar', 'ar', isDefault: false),
                const Divider(),
                _langRow(context, 'Français', 'fr', 'fr', isDefault: false),
              ]),
            ),
          ),
        ]);
      } else {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                  child: Row(children: [
                    const Icon(Icons.info_outline, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Text('You should set the default language only once during the initial setup and avoid changing it later.',
                        style: theme.textTheme.displaySmall!.copyWith(fontSize: 9)),
                  ]),
                ),
              ]),
              const SizedBox(height: 16),
              _dropdownRow(context, 'Choose a language', ['Select language']),
              _textRow(context, 'Language name'),
              _dropdownRow(context, 'Locale', ['Select locale', 'en_US', 'fr_FR', 'ar_AR', 'vi_VN']),
              _dropdownRow(context, 'Language code', ['Select language code', 'en', 'fr', 'ar', 'vi']),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text('Text direction', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              ),
              Row(children: [
                _radio(context, 'Left to right', true),
                const SizedBox(width: 20),
                _radio(context, 'Right to left', false),
              ]),
              _dropdownRow(context, 'Flag', ['Select a flag...']),
              _textRow(context, 'Order', initial: '0'),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(onPressed: () {}, child: const Text('Add new language')),
              ),
            ]),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _langRow(context, 'English', 'en', 'en_US', isDefault: true),
              const Divider(),
              _langRow(context, 'Tiếng Việt', 'vi', 'vi', isDefault: false),
              const Divider(),
              _langRow(context, 'Arabic', 'ar', 'ar', isDefault: false),
              const Divider(),
              _langRow(context, 'Français', 'fr', 'fr', isDefault: false),
            ]),
          ),
        ]);
      }
    });
  }

  Widget _dropdownRow(BuildContext context, String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: items.first,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (_) {},
        ),
      ]),
    );
  }

  Widget _textRow(BuildContext context, String label, {String? initial}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(initialValue: initial),
      ]),
    );
  }

  Widget _radio(BuildContext context, String label, bool selected) {
    return Row(children: [
      Radio(value: selected, groupValue: true, onChanged: (_) {}),
      Text(label, style: Theme.of(context).textTheme.displaySmall),
    ]);
  }

  Widget _langRow(BuildContext context, String name, String code, String locale, {required bool isDefault}) {
    final theme = Theme.of(context);
    return Row(children: [
      Expanded(child: Text(name, style: theme.textTheme.labelSmall)),
      SizedBox(width: 70, child: Text(code, style: theme.textTheme.displaySmall)),
      SizedBox(width: 90, child: Text(locale, style: theme.textTheme.displaySmall)),
      SizedBox(width: 90, child: Text(isDefault ? '★' : '', style: theme.textTheme.displaySmall)),
      Row(children: const [
        _SmallBtn(color: Colors.blue, icon: Icons.edit),
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

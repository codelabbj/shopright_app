import 'package:flutter/material.dart';

class SettingsGeneralWidget extends StatelessWidget {
  const SettingsGeneralWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(children: [
      _LicenseCard(),
      const SizedBox(height: 16),
      Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: theme.brightness == Brightness.light
              ? [BoxShadow(color: Colors.grey.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 3))]
              : [],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('General Information', style: theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _FormRow(label: 'Admin Email', child: _textField(context, hint: 'admin@example.com', helper: 'You can add maximum 4 emails', addMore: true)),
          _FormRow(label: 'Timezone', child: _dropdown(context, items: const ['UTC', 'GMT+1', 'GMT+7'])),
          _FormRow(
            label: 'Front site language direction',
            child: Row(children: [
              _radio(context, label: 'Left to Right', selected: true),
              const SizedBox(width: 24),
              _radio(context, label: 'Right to Left'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text('To set up the site language, please go to Languages page. Or go to Appearance to set up the admin language.',
                style: theme.textTheme.displaySmall),
          ),
          _FormRow(label: 'Site language', child: _dropdown(context, items: const ['English - en', 'French - fr', 'Arabic - ar'])),
          _FormRow(label: '', child: _checkbox(context, 'Send error reporting via email')),
          _FormRow(label: '', child: _checkbox(context, 'Redirect all Not Found requests to homepage')),
          _FormRow(label: 'Clear old Request Logs', child: _dropdown(context, items: const ['1 Month', '3 Months', '6 Months', '1 Year'])),
          _note(context,
              'To use this feature, you need to set up a cron job by following this link: https://shofy.botble.com/admin/system/cronjob.'),
          _FormRow(label: 'Clear old Audit Logs', child: _dropdown(context, items: const ['1 Month', '3 Months', '6 Months', '1 Year'])),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Save settings'),
            ),
          )
        ]),
      ),
    ]);
  }

  Widget _textField(BuildContext context, {String? hint, String? helper, bool addMore = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(decoration: InputDecoration(hintText: hint)),
      if (helper != null) ...[
        const SizedBox(height: 6),
        Text(helper, style: Theme.of(context).textTheme.displaySmall),
      ],
      if (addMore) ...[
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Text('+ Add more', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.blue)),
        )
      ]
    ]);
  }

  Widget _dropdown(BuildContext context, {required List<String> items}) {
    return DropdownButtonFormField<String>(
      value: items.first,
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: (_) {},
    );
  }

  Widget _checkbox(BuildContext context, String label) {
    return Row(children: [
      Checkbox(value: false, onChanged: (_) {}),
      Text(label, style: Theme.of(context).textTheme.displaySmall),
    ]);
  }

  Widget _radio(BuildContext context, {required String label, bool selected = false}) {
    return Row(children: [
      Radio(value: selected, groupValue: true, onChanged: (_) {}),
      Text(label, style: Theme.of(context).textTheme.displaySmall),
    ]);
  }

  Widget _note(BuildContext context, String text) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.15),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: theme.textTheme.displaySmall),
    );
  }
}

class _LicenseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: theme.brightness == Brightness.light
            ? [BoxShadow(color: Colors.grey.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 3))]
            : [],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('Licensed to Botble Technologies. Activated since Sep 11 2025.',
              style: theme.textTheme.displaySmall!.copyWith(color: Colors.blue)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 36,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {},
            child: const Text('Deactivate license'),
          ),
        ),
      ]),
    );
  }
}

class _FormRow extends StatelessWidget {
  final String label;
  final Widget child;
  const _FormRow({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (label.isNotEmpty) ...[
          Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
        ],
        child,
      ]),
    );
  }
}



import 'package:flutter/material.dart';

import '../../../../widgets/custom_drop_menu.dart';
import '../../../../widgets/customs_text_form_field.dart';
import '../../../web/ecommerce/products/widgets/validation_widget.dart';

class CreateCityWidget extends StatefulWidget {
  const CreateCityWidget({super.key});

  @override
  State<CreateCityWidget> createState() => _CreateCityWidgetState();
}

class _CreateCityWidgetState extends State<CreateCityWidget> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _slug = TextEditingController();
  final TextEditingController _zip = TextEditingController();
  final TextEditingController _order = TextEditingController(text: '0');
  bool _isDefault = false;
  String _status = 'Published';
  String? _country;
  String? _state;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        flex: 3,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _note(context),
            const SizedBox(height: 12),
            CustomTextFormField(label: 'Name', controller: _name),
            const SizedBox(height: 12),
            CustomTextFormField(label: 'Slug', controller: _slug),
            const SizedBox(height: 12),
            Text('Country *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            CustomDropdownField(
              value: _country ?? 'United States of America',
              items: const ['United States of America', 'France', 'Nigeria'],
              onChanged: (v) => setState(() => _country = v),
            ),
            const SizedBox(height: 12),
            Text('State', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            CustomDropdownField(
              value: _state ?? 'Texas',
              items: const ['Texas', 'Washington'],
              onChanged: (v) => setState(() => _state = v),
            ),
            const SizedBox(height: 12),
            CustomTextFormField(label: 'Zip code', controller: _zip),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'The basic format for a zip code is five digits. For example, in the United States, 00501 is an example of a unique ZIP Code for the Internal Revenue Service in Holtsville, New York.',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 12),
            CustomTextFormField(label: 'Sort order', controller: _order),
            const SizedBox(height: 12),
            Row(children: [
              Switch(value: _isDefault, onChanged: (v) => setState(() => _isDefault = v)),
              const SizedBox(width: 8),
              Text('Is default?', style: Theme.of(context).textTheme.labelSmall),
            ]),
          ]),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(children: [
          _publishCard(context),
          const SizedBox(height: 12),
          _imageCard(context),
        ]),
      ),
    ]);
  }

  Widget _note(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.displaySmall,
          children: const [
            TextSpan(text: 'You are editing '),
            TextSpan(text: '"English"', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' version'),
          ],
        ),
      ),
    );
  }

  Widget _publishCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Publish', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        // Row(children: [
        //   ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.save_outlined), label: const Text('Save')),
        //   const SizedBox(width: 10),
        //   OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.exit_to_app), label: const Text('Save & Exit')),
        // ]),
        const SizedBox(height: 16),
        Text('Status', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomDropdownField(
          value: _status,
          items: const ['Published', 'Draft'],
          onChanged: (v) => setState(() => _status = v ?? 'Published'),
        ),
        const SizedBox(height: 16),
        const ValidationWidget(),
      ]),
    );
  }

  Widget _imageCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Image', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          alignment: Alignment.center,
          child: Text('Choose image\nor Add from URL', textAlign: TextAlign.center, style: Theme.of(context).textTheme.displaySmall),
        ),
      ]),
    );
  }
}

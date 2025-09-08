import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateContactCustomFieldWidget extends StatefulWidget {
  const CreateContactCustomFieldWidget({super.key});

  @override
  State<CreateContactCustomFieldWidget> createState() => _CreateContactCustomFieldWidgetState();
}

class _CreateContactCustomFieldWidgetState extends State<CreateContactCustomFieldWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeholderController = TextEditingController();
  final TextEditingController orderController = TextEditingController(text: '999');

  final List<String> types = const ['Text', 'Number', 'Textarea', 'Select'];
  String selectedType = 'Text';
  bool requiredField = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(6)),
          child: RichText(
            text: TextSpan(style: Theme.of(context).textTheme.labelSmall, children: const [
              TextSpan(text: 'You are editing '),
              TextSpan(text: '"English"', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' version'),
            ]),
          ),
        ),
        const SizedBox(height: 16),
        Text('Type *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomDropdownField(value: selectedType, items: types, onChanged: (v) => setState(() => selectedType = v ?? selectedType)),
        const SizedBox(height: 12),
        Text('Name *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Name', controller: nameController),
        const SizedBox(height: 12),
        Text('Placeholder', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Placeholder', controller: placeholderController),
        const SizedBox(height: 12),
        Row(children: [
          Switch(value: requiredField, onChanged: (v) => setState(() => requiredField = v)),
          const SizedBox(width: 6),
          Text('Required', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))
        ]),
        const SizedBox(height: 12),
        Text('Order *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: '999', controller: orderController),
      ]),
    );
  }
}



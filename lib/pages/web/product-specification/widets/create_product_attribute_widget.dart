import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateProductAttributeWidget extends StatefulWidget {
  const CreateProductAttributeWidget({super.key});

  @override
  State<CreateProductAttributeWidget> createState() => _CreateProductAttributeWidgetState();
}

class _CreateProductAttributeWidgetState extends State<CreateProductAttributeWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController defaultValueController = TextEditingController();

  final List<String> groups = ['Dimensions', 'Performance', 'Battery', 'Display'];
  late String selectedGroup;

  final List<String> fieldTypes = ['Text', 'Number', 'Select'];
  late String selectedFieldType;

  @override
  void initState() {
    super.initState();
    selectedGroup = groups.first;
    selectedFieldType = fieldTypes.first;
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text('Associated Group *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomDropdownField(
            value: selectedGroup,
            items: groups,
            onChanged: (val) => setState(() => selectedGroup = val ?? selectedGroup),
          ),
          const SizedBox(height: 12),
          Text('Name *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'Enter attribute name', controller: nameController),
          const SizedBox(height: 12),
          Text('Field Type *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomDropdownField(
            value: selectedFieldType,
            items: fieldTypes,
            onChanged: (val) => setState(() => selectedFieldType = val ?? selectedFieldType),
          ),
          const SizedBox(height: 12),
          Text('Default Value', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'Enter default value (optional)', controller: defaultValueController, isMultiline: true),
        ],
      ),
    );
  }
}



import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateProductTableWidget extends StatefulWidget {
  const CreateProductTableWidget({super.key});

  @override
  State<CreateProductTableWidget> createState() => _CreateProductTableWidgetState();
}

class _CreateProductTableWidgetState extends State<CreateProductTableWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<_GroupOption> groups = [
    _GroupOption('Dimensions'),
    _GroupOption('Performance'),
    _GroupOption('Battery'),
    _GroupOption('Display'),
  ];

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
          Text('Group name *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'Name', controller: nameController),
          const SizedBox(height: 12),
          Text('Description', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'Short description', controller: descriptionController, isMultiline: true),
          const SizedBox(height: 12),
          Text('Select the groups to display in this table *',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: groups.map((g) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StatefulBuilder(builder: (context, setSB) {
                    return Checkbox(
                      value: g.checked,
                      onChanged: (v) => setState(() => g.checked = v ?? false),
                    );
                  }),
                  Text(g.label, style: Theme.of(context).textTheme.labelSmall),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _GroupOption {
  final String label;
  bool checked = false;
  _GroupOption(this.label);
}



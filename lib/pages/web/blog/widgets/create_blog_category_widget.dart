import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateBlogCategoryWidget extends StatefulWidget {
  const CreateBlogCategoryWidget({super.key});

  @override
  State<CreateBlogCategoryWidget> createState() => _CreateBlogCategoryWidgetState();
}

class _CreateBlogCategoryWidgetState extends State<CreateBlogCategoryWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController permalinkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<String> parents = const ['None', 'Crisp Bread & Cake', 'Fashion', 'Electronic', 'Commercial', 'Organic Fruits', 'Ecological'];
  String selectedParent = 'None';

  bool isDefault = false;
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
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
        Text('Name *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Name', controller: nameController),
        const SizedBox(height: 12),
        Text('Permalink *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'https://shofy.botble.com/blog/', controller: permalinkController),
        const SizedBox(height: 12),
        Text('Parent', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomDropdownField(value: selectedParent, items: parents, onChanged: (v) => setState(() => selectedParent = v ?? selectedParent)),
        const SizedBox(height: 12),
        Text('Description', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Short description', controller: descriptionController, isMultiline: true),
        const SizedBox(height: 12),
        Row(children: [
          Switch(value: isDefault, onChanged: (v) => setState(() => isDefault = v)),
          const SizedBox(width: 6),
          Text('Is default?', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        ]),
        Row(children: [
          Switch(value: isFeatured, onChanged: (v) => setState(() => isFeatured = v)),
          const SizedBox(width: 6),
          Text('Is featured?', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        ]),
      ]),
    );
  }
}



import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreatePageWidget extends StatefulWidget {
  const CreatePageWidget({super.key});

  @override
  State<CreatePageWidget> createState() => _CreatePageWidgetState();
}

class _CreatePageWidgetState extends State<CreatePageWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController permalinkController = TextEditingController(text: 'https://shofy.botble.com/');
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

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
        CustomTextFormField(hintText: 'https://shofy.botble.com/', controller: permalinkController),
        const SizedBox(height: 12),
        Text('Description', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Short description', controller: descriptionController, isMultiline: true),
        const SizedBox(height: 12),
        Text('Content', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Write your content here...', controller: contentController, isMultiline: true),
      ]),
    );
  }
}



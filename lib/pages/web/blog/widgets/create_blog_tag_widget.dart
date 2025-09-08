import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateBlogTagWidget extends StatelessWidget {
  const CreateBlogTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController permalinkController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

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
          Text('Name *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'Name', controller: nameController),
          const SizedBox(height: 12),
          Text('Permalink *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'https://shofy.botble.com/tag/', controller: permalinkController),
          const SizedBox(height: 12),
          Text('Description', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          CustomTextFormField(hintText: 'Short description', controller: descriptionController, isMultiline: true),
        ],
      ),
    );
  }
}

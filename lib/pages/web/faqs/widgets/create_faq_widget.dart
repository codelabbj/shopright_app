import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateFaqWidget extends StatefulWidget {
  const CreateFaqWidget({super.key});

  @override
  State<CreateFaqWidget> createState() => _CreateFaqWidgetState();
}

class _CreateFaqWidgetState extends State<CreateFaqWidget> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final List<String> categories = const ['General', 'Orders', 'Shipping', 'Payments'];
  String? selectedCategory;

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
        Text('Category *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomDropdownField(value: selectedCategory ?? categories.first, items: categories, onChanged: (v) => setState(() => selectedCategory = v)),
        const SizedBox(height: 12),
        Text('Question *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Question', controller: questionController),
        const SizedBox(height: 12),
        Text('Answer *', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextFormField(hintText: 'Answer', controller: answerController, isMultiline: true),
      ]),
    );
  }
}



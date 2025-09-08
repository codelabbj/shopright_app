import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateStoreWidget extends StatefulWidget {
  const CreateStoreWidget({super.key});

  @override
  State<CreateStoreWidget> createState() => _CreateStoreWidgetState();
}

class _CreateStoreWidgetState extends State<CreateStoreWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController taxIdController = TextEditingController();

  final List<String> countries = const ['USA', 'Canada', 'UK', 'France'];
  String? selectedCountry;
  final List<String> states = const ['State 1', 'State 2', 'State 3'];
  String? selectedState;

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
          Row(children: [
            Expanded(child: _labeled('Name *', CustomTextFormField(hintText: 'Name', controller: nameController))),
            const SizedBox(width: 12),
            Expanded(child: _labeled('Email *', CustomTextFormField(hintText: 'Email', controller: emailController))),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _labeled('Shop URL', CustomTextFormField(hintText: 'Shop URL', controller: urlController))),
            const SizedBox(width: 12),
            Expanded(child: _labeled('Phone *', CustomTextFormField(hintText: 'Phone', controller: phoneController))),
          ]),
          const SizedBox(height: 12),
          _labeled('Description', CustomTextFormField(hintText: 'Short description', controller: descriptionController, isMultiline: true)),
          const SizedBox(height: 12),
          _labeled('Content', CustomTextFormField(hintText: 'Content', controller: contentController, isMultiline: true)),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
              child: _labeled(
                'Country',
                CustomDropdownField(
                    value: selectedCountry ?? countries.first, items: countries, onChanged: (v) => setState(() => selectedCountry = v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _labeled(
                'State',
                CustomDropdownField(value: selectedState ?? states.first, items: states, onChanged: (v) => setState(() => selectedState = v)),
              ),
            ),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _labeled('City', CustomTextFormField(hintText: 'City', controller: cityController))),
            const SizedBox(width: 12),
            Expanded(child: _labeled('Address', CustomTextFormField(hintText: 'Enter address', controller: addressController))),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _labeled('Company', CustomTextFormField(hintText: 'Company', controller: companyController))),
            const SizedBox(width: 12),
            Expanded(child: _labeled('Tax ID', CustomTextFormField(hintText: 'Tax ID', controller: taxIdController))),
          ]),
          const SizedBox(height: 16),
          // Social links grid simplified
          Text('Social links', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
              child: _SocialField(label: 'Facebook'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialField(label: 'X (Twitter)'),
            ),
          ]),
          Row(children: [
            Expanded(
              child: _SocialField(label: 'Instagram'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialField(label: 'Pinterest'),
            ),
          ]),
          Row(children: [
            Expanded(
              child: _SocialField(label: 'Youtube'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialField(label: 'LinkedIn'),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _labeled(String title, Widget field) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      field,
    ]);
  }
}

class _SocialField extends StatelessWidget {
  final String label;
  const _SocialField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      CustomTextFormField(hintText: 'https://', controller: TextEditingController()),
    ]);
  }
}

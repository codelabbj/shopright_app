import 'package:flutter/material.dart';

import '../../../../../widgets/custom_drop_menu.dart';
import '../../../../../widgets/customs_text_form_field.dart';

class CreateBrandWidget extends StatefulWidget {
  const CreateBrandWidget({super.key});

  @override
  State<CreateBrandWidget> createState() => _CreateBrandWidgetState();
}

class _CreateBrandWidgetState extends State<CreateBrandWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedStatus = 'Published';
  final List<String> categories = ['Accessories', 'Headphones', 'Speakers'];
  final List<String> discountOptions = ['No Discount', 'Percentage %', 'Bundling'];
  final List<String> statuses = ['Published', 'Draft', 'Archived'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            label: "Tag Name",
            hintText: "Enter product name ",
            controller: _idController,
          ),
          CustomTextFormField(
            label: "Permalink",
            hintText: "https://easy.shopright.com/products/",
            controller: _nameController,
          ),
          CustomTextFormField(
            label: "Description",
            hintText: "Enter description",
            controller: _descriptionController,
            isMultiline: true,
          ),
          CustomTextFormField(
            label: "Website",
            hintText: "Exemple:https//example.com",
            controller: _descriptionController,
          ),
          CustomDropdownField(
            label: "Status",
            value: _selectedStatus,
            items: ["Published", "Draft", "Archived"],
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _selectedStatus = val;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

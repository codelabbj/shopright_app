import 'package:e_com_app/pages/web/ecommerce/brands-reviews/widgets/upload_files_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_drop_menu.dart';
import '../../../../../widgets/customs_text_form_field.dart';

class CreateReviewWidget extends StatefulWidget {
  const CreateReviewWidget({super.key});

  @override
  State<CreateReviewWidget> createState() => _CreateReviewWidgetState();
}

class _CreateReviewWidgetState extends State<CreateReviewWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedStars = '5';
  String _selectedProduct = 'Laptop';
  final List<String> categories = ['Accessories', 'Headphones', 'Speakers'];
  final List<String> discountOptions = ['No Discount', 'Percentage %', 'Bundling'];
  final List<String> statuses = ['Published', 'Draft', 'Archived'];
  final List<String> products = ['Passoire', 'Laptop', 'Macbook'];
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
          CustomDropdownField(
            label: "Product*",
            value: _selectedProduct,
            items: products,
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _selectedProduct = val;
                });
              }
            },
          ),
          CustomDropdownField(
            label: "Choose from existing Customers",
            value: _selectedProduct,
            items: products,
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _selectedProduct = val;
                });
              }
            },
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[100]),
            child: Column(
              children: [
                CustomTextFormField(
                  label: "Customer",
                  // hintText: "Enter product name ",
                  controller: _idController,
                ),
                CustomTextFormField(
                  label: "Customer email",
                  hintText: "example@domain.com",
                  controller: _nameController,
                ),
              ],
            ),
          ),
          CustomDropdownField(
            label: "Stars",
            value: _selectedStars,
            items: ["1", "2", "3", "4", "5"],
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _selectedStars = val;
                });
              }
            },
          ),
          UploadFilesWidget(),
        ],
      ),
    );
  }
}

import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateFlashWidget extends StatefulWidget {
  const CreateFlashWidget({super.key});

  @override
  State<CreateFlashWidget> createState() => _CreateFlashWidgetState();
}

class _CreateFlashWidgetState extends State<CreateFlashWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          child: CustomTextFormField(label: "Name", controller: nameController),
        ),
        SizedBox(height: 13),
        Container(
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
            children: [
              CustomTextFormField(label: "Products", controller: nameController),
            ],
          ),
        )
      ],
    );
  }
}

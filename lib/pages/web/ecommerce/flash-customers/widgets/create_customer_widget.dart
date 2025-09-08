import 'package:e_com_app/pages/web/ecommerce/flash-customers/widgets/pick_date_widget.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateCustomerWidget extends StatefulWidget {
  const CreateCustomerWidget({super.key});

  @override
  State<CreateCustomerWidget> createState() => _CreateCustomerWidgetState();
}

class _CreateCustomerWidgetState extends State<CreateCustomerWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
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
            offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: CustomTextFormField(label: "Name", controller: nameController)),
              SizedBox(width: 10),
              Expanded(flex: 2, child: CustomTextFormField(label: "Email", controller: emailController)),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 2, child: CustomTextFormField(label: "Phone number", controller: phoneController)),
              SizedBox(width: 10),
              Expanded(flex: 2, child: DateOfBirthField()),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 2, child: CustomTextFormField(label: "Password", controller: passwordController)),
              SizedBox(width: 10),
              Expanded(flex: 2, child: CustomTextFormField(label: "Confirmation Password", controller: confirmPassController)),
            ],
          ),
          CustomTextFormField(label: "Private notes", isMultiline: true, controller: confirmPassController),
        ],
      ),
    );
  }
}

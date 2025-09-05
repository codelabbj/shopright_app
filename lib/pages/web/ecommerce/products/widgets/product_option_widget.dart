import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';
import '../../../../../widgets/custom_drop_menu.dart';
import '../../../../../widgets/customs_text_form_field.dart';

class ProductOptionsWidget extends StatefulWidget {
  const ProductOptionsWidget({super.key});

  @override
  State<ProductOptionsWidget> createState() => _ProductOptionsWidgetState();
}

class _ProductOptionsWidgetState extends State<ProductOptionsWidget> {
  List<OptionItem> options = [OptionItem()];
  String selectedValue = 'Please select';

  void addNewOption() {
    setState(() {
      options.add(OptionItem());
    });
  }

  void removeOption(int index) {
    setState(() {
      options.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalOptions = ['Option 1', 'Option 2', 'Option 3'];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ...options.asMap().entries.map((entry) {
            int index = entry.key;
            OptionItem option = entry.value;

            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[300]!)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${index + 1}', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomTextFormField(
                          label: 'Option Name',
                          hintText: 'Enter option name',
                          controller: option.controller,
                          onChanged: (val) {
                            option.name = val;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: CustomDropdownField(
                          label: "Type",
                          value: option.type ?? "Number",
                          items: [
                            'Please select',
                            'Text',
                            'Number',
                            'Date',
                            'Dropdown',
                          ],
                          onChanged: (value) {
                            setState(() {
                              option.type = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Checkbox(
                        value: option.isRequired,
                        onChanged: (value) {
                          setState(() {
                            option.isRequired = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Is required?',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const Spacer(),
                      if (index != 0)
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: () => removeOption(index),
                            child: Image.asset(
                              "assets/images/supprimer.png",
                              width: 22,
                              height: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.PRIMARY_BLUE_COLOR, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  onPressed: addNewOption,
                  child: Text(
                    'Add new option',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomDropdownField(
                  label: '',
                  value: selectedValue,
                  items: ['Please select', 'Text', 'Number', 'Date', 'Dropdown'],
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue ?? 'Please select';
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     // Ajouter une option globale ici
              //   },
              //   child: const Text('Add Global Option'),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class OptionItem {
  String? name;
  String? type = 'Please select';
  bool isRequired = true;
  TextEditingController controller = TextEditingController();
}

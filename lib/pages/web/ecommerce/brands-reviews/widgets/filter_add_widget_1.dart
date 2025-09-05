import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';
import '../../../../../widgets/custom_drop_menu.dart';

class FilterAddWidget1 extends StatefulWidget {
  const FilterAddWidget1({super.key});

  @override
  State<FilterAddWidget1> createState() => _FilterAddWidget1State();
}

class _FilterAddWidget1State extends State<FilterAddWidget1> {
  final List<Map<String, dynamic>> allAttributes = [
    {
      'name': 'Color',
      'values': ['Green', 'Red', 'Blue']
    },
    {
      'name': 'Weight',
      'values': ['1KG', '2KG', '5KG']
    },
    {
      'name': 'Size',
      'values': ['S', 'M', 'L']
    },
    {
      'name': 'Boxes',
      'values': ['1 Box', '2 Boxes', '3 Boxes']
    },
    {
      'name': 'Material',
      'values': ['Plastic', 'Metal', 'Wood']
    },
  ];

  final List<Map<String, dynamic>> selectedAttributes = [];

  @override
  void initState() {
    super.initState();
    // Ajouter un attribut par défaut au démarrage
    addAttribute();
  }

  void addAttribute() {
    // Trouver le premier attribut non encore utilisé
    final unused = allAttributes.where((attr) => !selectedAttributes.any((sel) => sel['name'] == attr['name'])).toList();

    if (unused.isEmpty) return;

    final attr = unused.first;

    setState(() {
      selectedAttributes.add({
        'name': attr['name'],
        'values': attr['values'],
        'selectedValue': attr['values'][0],
      });
    });
  }

  void removeAttribute(int index) {
    setState(() {
      selectedAttributes.removeAt(index);
    });
  }

  void onAttributeNameChanged(int index, String newName) {
    final attrData = allAttributes.firstWhere((element) => element['name'] == newName);

    setState(() {
      selectedAttributes[index] = {
        'name': newName,
        'values': attrData['values'],
        'selectedValue': attrData['values'][0], // reset to first value
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableAttributeNames = allAttributes.map((e) => e['name'] as String).toList();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Attributes", style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            "Adding new attributes helps the product to have many options, such as size or color.",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 20),
          ...selectedAttributes.asMap().entries.map((entry) {
            final index = entry.key;
            final attr = entry.value;

            final usedNames = selectedAttributes.map((e) => e['name']).toList();
            final availableNames = availableAttributeNames.where((name) => name == attr['name'] || !usedNames.contains(name)).toList();

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownField(
                          label: "Attribute name",
                          value: attr['name'],
                          items: availableNames,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              onAttributeNameChanged(index, newValue);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownField(
                          label: "Value",
                          value: attr['selectedValue'],
                          items: List<String>.from(attr['values']),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedAttributes[index]['selectedValue'] = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (index != 0)
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onTap: () => removeAttribute(index),
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
            );
          }).toList(),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.PRIMARY_BLUE_COLOR, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            onPressed: selectedAttributes.length < allAttributes.length ? addAttribute : null,
            child: Text(
              selectedAttributes.length < allAttributes.length ? "Add more attribute" : "All attributes added",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

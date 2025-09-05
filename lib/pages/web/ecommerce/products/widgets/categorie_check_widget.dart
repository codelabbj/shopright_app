import 'package:flutter/material.dart';

import '../../../../../widgets/custom_drop_menu.dart';

class FilterSidebar extends StatefulWidget {
  const FilterSidebar({super.key});

  @override
  State<FilterSidebar> createState() => _FilterSidebarState();
}

class _FilterSidebarState extends State<FilterSidebar> {
  final TextEditingController searchController = TextEditingController();

  // Exemple de catégories avec sous-catégories
  final Map<String, List<String>> categories = {
    'New Arrivals': [],
    'Electronics': [],
    'Featured': ['New Arrivals', 'Best Sellers', 'Mobile Phone'],
    'Computers & Laptops': ['Top Brands', 'Weekly Best Selling', 'CPU Heat Pipes'],
  };

  final Set<String> selectedCategories = {};
  String? selectedBrand;

  final List<String> brands = ['Apple', 'Samsung', 'HP', 'Lenovo', 'Asus'];

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
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories
          Text("Categories", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          ...categories.entries.map((entry) {
            final mainCategory = entry.key;
            final subCategories = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  side: BorderSide(color: Colors.grey[300]!),
                  title: Text(
                    mainCategory,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  value: selectedCategories.contains(mainCategory),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedCategories.add(mainCategory);
                      } else {
                        selectedCategories.remove(mainCategory);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                // if (subCategories.isNotEmpty)
                //   Padding(
                //     padding: const EdgeInsets.only(left: 16),
                //     child: Column(
                //       children: subCategories.map((sub) {
                //         return CheckboxListTile(
                //           title: Text(sub),
                //           value: selectedCategories.contains(sub),
                //           onChanged: (bool? value) {
                //             setState(() {
                //               if (value == true) {
                //                 selectedCategories.add(sub);
                //               } else {
                //                 selectedCategories.remove(sub);
                //               }
                //             });
                //           },
                //           controlAffinity: ListTileControlAffinity.leading,
                //           dense: true,
                //           contentPadding: EdgeInsets.zero,
                //         );
                //       }).toList(),
                //     ),
                //   ),
              ],
            );
          }),

          const SizedBox(height: 24),

          // Brand section
          Text("Brand", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CustomDropdownField(
            label: "Select a brand...",
            value: selectedBrand ?? "Samsung",
            items: brands,
            onChanged: (value) {
              setState(() {
                selectedBrand = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

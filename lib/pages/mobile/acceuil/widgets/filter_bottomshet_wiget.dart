import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedMainCategory;
  String? selectedSubCategory;
  String? selectedSize;

  final List<String> mainCategories = ['Les plus vendus', 'Nouveautés'];

  final Map<String, List<String>> subCategories = {
    'Homme': ['T-shirts', 'Pantalons', 'Chaussures'],
    'Femme': ['Robes', 'Jupes', 'Accessoires'],
    'Bébé': ['Bodies', 'Pyjamas'],
    'Alimentaire': ['Épices', 'Snacks', 'Boissons'],
  };

  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final accentColor = Colors.yellow[700]!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // En-tête
          Row(
            children: [
              Icon(
                Icons.tune,
                color: Colors.black87,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Filtrer',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Catégories principales
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Catégorie", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: mainCategories.map((cat) {
                  return ChoiceChip(
                    backgroundColor: Colors.white,
                    label: Text(
                      cat,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 15),
                    ),
                    selected: selectedMainCategory == cat,
                    selectedColor: Color(0xFFFF9B00),
                    onSelected: (val) {
                      setState(() {
                        selectedMainCategory = val ? cat : null;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Sous-catégories
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sous-catégories", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 5,
                children: subCategories.keys.map((subCat) {
                  return ChoiceChip(
                    backgroundColor: Colors.white,
                    label: Text(
                      subCat,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 15),
                    ),
                    selected: selectedSubCategory == subCat,
                    selectedColor: Color(0xFFFF9B00),
                    onSelected: (val) {
                      setState(() {
                        selectedSubCategory = val ? subCat : null;
                        selectedSize = null;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Tailles (si sous-catégorie = vêtement)
          if (['Homme', 'Femme', 'Bébé'].contains(selectedSubCategory))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Taille", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: sizes.map((size) {
                    return ChoiceChip(
                      backgroundColor: Colors.white,
                      label: Text(
                        size,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 15),
                      ),
                      selected: selectedSize == size,
                      selectedColor: Color(0xFFFF9B00),
                      onSelected: (val) {
                        setState(() {
                          selectedSize = val ? size : null;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),

          const SizedBox(height: 24),

          // Bouton appliquer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                print('Catégorie: $selectedMainCategory');
                print('Sous-catégorie: $selectedSubCategory');
                print('Taille: $selectedSize');
              },
              label: Text(
                "Appliquer les filtres",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF9B00),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

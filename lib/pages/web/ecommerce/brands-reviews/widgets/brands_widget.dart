import 'package:flutter/material.dart';

import '../../../../../models/brand_model.dart';

class BrandsWidget extends StatefulWidget {
  const BrandsWidget({super.key});

  @override
  State<BrandsWidget> createState() => _BrandsWidgetState();
}

class _BrandsWidgetState extends State<BrandsWidget> {
  final List<BrandModel> items = const [
    BrandModel(id: 5, name: 'Soda Brand', logo: 'assets/images/brand.png', isFeatured: true, status: 'Published', createdAt: '2025-08-08'),
    BrandModel(id: 4, name: 'Shofy', logo: 'assets/images/brand.png', isFeatured: true, status: 'Published', createdAt: '2025-08-08'),
    BrandModel(id: 3, name: 'Soda Brand', logo: 'assets/images/brand.png', isFeatured: true, status: 'Published', createdAt: '2025-08-08'),
    BrandModel(id: 2, name: 'iTea JSC', logo: 'assets/images/brand.png', isFeatured: true, status: 'Published', createdAt: '2025-08-08'),
    BrandModel(id: 1, name: 'FoodPound', logo: 'assets/images/brand.png', isFeatured: true, status: 'Published', createdAt: '2025-08-08'),
  ];

  late List<bool> selected;

  @override
  void initState() {
    super.initState();
    selected = List.generate(items.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: const [
        DataColumn(label: SizedBox()),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Logo')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Is Featured')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final isSelected = selected[index];
        return DataRow(
          selected: isSelected,
          color: MaterialStateProperty.resolveWith<Color?>((states) => isSelected ? Colors.blue[100] : null),
          cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                value: isSelected,
                side: BorderSide(color: Colors.grey[500]!),
                onChanged: (val) => setState(() => selected[index] = val!),
              ),
            )),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Image.asset(item.logo, width: 40, height: 24)),
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.isFeatured ? 'Yes' : 'No', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.green.withValues(alpha: 0.2)),
              child: SizedBox(
                width: 94,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(children: [
                    const Icon(Icons.circle, size: 10, color: Colors.green),
                    const SizedBox(width: 2),
                    Expanded(child: Text(item.status, style: Theme.of(context).textTheme.labelSmall)),
                  ]),
                ),
              ),
            )),
            DataCell(Row(children: [
              IconButton(
                icon: Row(children: [
                  Image.asset('assets/images/editer.png', width: 15, height: 15),
                  const SizedBox(width: 5),
                  Text('Edit', style: Theme.of(context).textTheme.displaySmall),
                ]),
                onPressed: () {},
              ),
              IconButton(
                icon: Row(children: [
                  Image.asset('assets/images/supprimer.png', width: 15, height: 15, color: Colors.red),
                  const SizedBox(width: 5),
                  Text('Delete', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red)),
                ]),
                onPressed: () {},
              ),
            ])),
          ],
        );
      }),
    );
  }
}



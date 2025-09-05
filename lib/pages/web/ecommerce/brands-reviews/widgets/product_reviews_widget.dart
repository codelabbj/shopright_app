import 'package:flutter/material.dart';

import '../../../../../models/product_review_model.dart';

class ProductReviewsWidget extends StatefulWidget {
  const ProductReviewsWidget({super.key});

  @override
  State<ProductReviewsWidget> createState() => _ProductReviewsWidgetState();
}

class _ProductReviewsWidgetState extends State<ProductReviewsWidget> {
  final List<ProductReviewModel> items = const [
    ProductReviewModel(
      id: 996,
      product: 'Sony X900H 4K Ultra HD Smart LED TV',
      user: 'Lolita Casper II',
      stars: 2,
      comment: 'These guys are amazing! Responses immediately, amazing support and hel...',
      image: 'assets/images/box.png',
      status: 'Published',
      createdAt: '2025-08-08',
    ),
    ProductReviewModel(
      id: 991,
      product: 'Razer Blade 15 Advanced Gaming Laptop',
      user: 'Lolita Casper II',
      stars: 3,
      comment: 'Good app, good backup service and support. Good documentation.',
      image: 'assets/images/box.png',
      status: 'Published',
      createdAt: '2025-08-08',
    ),
  ];

  late List<bool> selected;
  bool selectAll = false;

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
      columns: [
        DataColumn(
          label: Transform.scale(
            scale: 0.7,
            child: Checkbox(
              value: selectAll,
              side: BorderSide(color: Colors.grey[500]!),
              onChanged: (value) {
                setState(() {
                  selectAll = value!;
                  for (int i = 0; i < selected.length; i++) {
                    selected[i] = selectAll;
                  }
                });
              },
            ),
          ),
        ),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Product')),
        DataColumn(label: Text('User')),
        DataColumn(label: Text('Star')),
        DataColumn(label: Text('Comment')),
        DataColumn(label: Text('Images')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Created at')),
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
            DataCell(Text(item.product, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.blue))),
            DataCell(Text(item.user, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Row(children: List.generate(5, (i) => Icon(Icons.star, size: 16, color: i < item.stars ? Colors.orange : Colors.grey[400])))),
            DataCell(SizedBox(width: 260, child: Text(item.comment, style: Theme.of(context).textTheme.labelSmall, overflow: TextOverflow.ellipsis))),
            DataCell(Image.asset(item.image, width: 34, height: 34)),
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
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
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

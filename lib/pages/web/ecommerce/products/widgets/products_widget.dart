import 'package:flutter/material.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final List<_ProductRow> rows = const [
    _ProductRow(
      id: 57,
      imageAsset: 'assets/images/winter_hooby.webp',
      name: 'Sony HT-A9 Home Theater System',
      type: 'Physical',
      price: '5 1,238.00',
      stockStatus: 'In stock',
      quantity: 36,
      sku: 'UL-112-A1',
      sortOrder: 0,
      createdAt: '2025-08-08',
      status: 'Published',
      store: "Robert's Store",
    ),
    _ProductRow(
      id: 56,
      imageAsset: 'assets/images/winter_cap.webp',
      name: 'Sennheiser Ambeo Soundbar (Digital)',
      type: 'Digital',
      price: '5 724.95',
      stockStatus: 'In stock',
      quantity: 19,
      sku: 'QD-118-A1',
      sortOrder: 0,
      createdAt: '2025-08-08',
      status: 'Published',
      store: 'Global Office',
    ),
  ];

  late List<bool> selected;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    selected = List<bool>.generate(rows.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: const [
        DataColumn(label: SizedBox.shrink()),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Image')),
        DataColumn(label: Text('Products')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Stock status')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('SKU')),
        DataColumn(label: Text('Sort order')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Store')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List<DataRow>.generate(rows.length, (index) {
        final item = rows[index];
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
                onChanged: (val) {
                  setState(() {
                    selected[index] = val ?? false;
                    selectAll = selected.every((s) => s);
                  });
                },
              ),
            )),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Image.asset(item.imageAsset, width: 36, height: 36, fit: BoxFit.cover)),
            DataCell(Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(item.name, style: Theme.of(context).textTheme.labelSmall!),
              Text(item.type, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey[500])),
            ])),
            DataCell(Text(item.price, style: Theme.of(context).textTheme.labelSmall)),
            _statusPill(item.stockStatus, context),
            DataCell(Text(item.quantity.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.sku, style: Theme.of(context).textTheme.labelSmall)),
            const DataCell(Text('0')),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _statusPill(item.status, context),
            DataCell(Text(item.store, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.blue))),
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

  static DataCell _statusPill(String status, BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case 'in stock':
        color = Colors.green;
        break;
      case 'out of stock':
        color = Colors.red;
        break;
      case 'published':
        color = Colors.green;
        break;
      default:
        color = Colors.blue;
    }
    return DataCell(Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
        child: SizedBox(
            width: 110,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(children: [
                  Icon(Icons.circle, size: 10, color: color),
                  const SizedBox(width: 2),
                  Expanded(child: Text(status, style: Theme.of(context).textTheme.labelSmall)),
                ])))));
  }
}

class _ProductRow {
  final int id;
  final String imageAsset;
  final String name;
  final String type;
  final String price;
  final String stockStatus;
  final int quantity;
  final String sku;
  final int sortOrder;
  final String createdAt;
  final String status;
  final String store;

  const _ProductRow({
    required this.id,
    required this.imageAsset,
    required this.name,
    required this.type,
    required this.price,
    required this.stockStatus,
    required this.quantity,
    required this.sku,
    required this.sortOrder,
    required this.createdAt,
    required this.status,
    required this.store,
  });
}

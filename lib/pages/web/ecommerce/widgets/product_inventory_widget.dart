import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';
import '../../../../models/product_inventory_item_model.dart';

class ProductInventoryWidget extends StatelessWidget {
  const ProductInventoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductInventoryItemModel> items = const [
      ProductInventoryItemModel(id: 34, title: 'Acer Predator X38...', sku: 'JS-108', imageAsset: '', storehouseManagement: true, quantity: 13),
      ProductInventoryItemModel(id: 22, title: 'Alienware m15 R6...', sku: 'CP-106-A1', imageAsset: '', storehouseManagement: false, quantity: 19),
      ProductInventoryItemModel(id: 11, title: 'Amazon Echo Show 10', sku: 'QL-168-A1', imageAsset: '', storehouseManagement: true, quantity: 11),
    ];

    return DataTable(
      columnSpacing: 12,
      dataRowMaxHeight: 70,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: const [
        // DataColumn(label: Text('')),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Image')),
        DataColumn(label: Expanded(child: Text('Products'))),
        DataColumn(label: Text('Storehouse Management')),
        DataColumn(label: Text('Quantity')),
      ],
      rows: items
          .map((e) => DataRow(cells: [
                // const DataCell(SizedBox()),
                DataCell(Text(e.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
                const DataCell(FlutterLogo(size: 30)),
                DataCell(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(e.title, style: Theme.of(context).textTheme.labelSmall!),
                  Text('SKU: ${e.sku}', style: Theme.of(context).textTheme.labelSmall!),
                ])),
                DataCell(SizedBox(
                    width: 100,
                    child: CustomDropdownField(value: e.storehouseManagement ? 'Yes' : 'No', items: const ["Yes", "No"], onChanged: (_) {}))),
                DataCell(Text(e.quantity.toString(), style: Theme.of(context).textTheme.labelSmall)),
              ]))
          .toList(),
    );
  }
}

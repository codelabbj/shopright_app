import 'package:e_com_app/models/page_item_model.dart';
import 'package:e_com_app/models/product_group_model.dart';
import 'package:flutter/material.dart';

import '../../../../models/gallerie_model.dart';
import '../../../../utils/utils.dart';

class ProductGroupWidget extends StatefulWidget {
  const ProductGroupWidget({Key? key}) : super(key: key);

  @override
  State<ProductGroupWidget> createState() => _ProductGroupWidgetState();
}

class _ProductGroupWidgetState extends State<ProductGroupWidget> {
  List<ProductGroupModel> items = [
    ProductGroupModel(
      id: 1,
      name: "Perfect",
      description: "Published",
      createdAt: '2025-08-08',
    ),
    ProductGroupModel(id: 2, name: "New Day", description: "__", createdAt: '2025-08-08'),
    ProductGroupModel(id: 3, name: "Happy Day", description: "__", createdAt: '2025-08-08'),
    ProductGroupModel(id: 4, name: "Nature", description: "__", createdAt: '2025-08-08'),
    ProductGroupModel(id: 5, name: "Morning", description: "__", createdAt: '2025-08-08'),
  ];

  List<bool> selected = [];

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
      // headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: [
        // DataColumn(
        //   label: Transform.scale(
        //     scale: 0.7,
        //     child: Checkbox(
        //       value: selectAll,
        //       side: BorderSide(color: Colors.grey[500]!),
        //       onChanged: (value) {
        //         setState(() {
        //           selectAll = value!;
        //           for (int i = 0; i < selected.length; i++) {
        //             selected[i] = selectAll;
        //           }
        //         });
        //       },
        //     ),
        //   ),
        // ),
        DataColumn(
            label: Text(
          "ID",
        )),
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Description")),
        DataColumn(label: Text("Created at")),
        DataColumn(label: Text("Actions")),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final isSelected = selected[index];
        return DataRow(
          selected: isSelected,
          color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (isSelected) return Colors.blue[100];
            return null;
          }),
          cells: [
            // DataCell(
            //   Transform.scale(
            //     scale: 0.7,
            //     child: Checkbox(
            //       value: isSelected,
            //       side: BorderSide(color: Colors.grey[500]!),
            //       onChanged: (val) {
            //         setState(() {
            //           selected[index] = val!;
            //           selectAll = selected.every((s) => s);
            //         });
            //       },
            //     ),
            //   ),
            // ),
            DataCell(Text(
              item.id.toString(),
              style: Theme.of(context).textTheme.labelSmall,
            )),
            DataCell(Text(
              item.name,
              style: Theme.of(context).textTheme.labelSmall,
            )),
            DataCell(Text(item.description, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _buildActionButtons(context),
          ],
        );
      }),
    );
  }

  static DataCell _buildActionButtons(context) {
    return DataCell(
      IconButton(
        icon: Row(
          children: [
            Image.asset(
              "assets/images/supprimer.png",
              width: 15,
              height: 15,
              color: Colors.red,
            ),
            SizedBox(width: 5),
            Text(
              "Delete",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red),
            ),
          ],
        ),
        onPressed: () {
          Utils.showDeleteDialog(context);
        },
      ),
    );
  }
}

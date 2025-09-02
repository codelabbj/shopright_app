import 'package:e_com_app/models/market_store_model.dart';
import 'package:e_com_app/models/page_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../models/gallerie_model.dart';
import '../../../../utils/utils.dart';

class MarketStoresWidget extends StatefulWidget {
  const MarketStoresWidget({Key? key}) : super(key: key);

  @override
  State<MarketStoresWidget> createState() => _MarketStoresWidgetState();
}

class _MarketStoresWidgetState extends State<MarketStoresWidget> {
  List<MarketStoreModel> items = [
    MarketStoreModel(
      id: 1,
      name: "Old El Paso",
      status: "Approved",
      logo: 'assets/images/winter_cap.webp',
      earnings: "2300.00\$",
      productsCount: "3",
      vendorFullame: "Elliott Durgan",
      createdAt: '2025-08-08',
    ),
    MarketStoreModel(
      id: 2,
      name: "StarKist",
      status: "Approved",
      logo: 'assets/images/winter_cap.webp',
      earnings: "2300.00\$",
      productsCount: "5",
      vendorFullame: "Mr. Dane Tromp",
      createdAt: '2025-08-08',
    ),
    MarketStoreModel(
      id: 3,
      name: "Robert’s Store",
      status: "Rejected",
      logo: 'assets/images/winter_cap.webp',
      earnings: "28.80\$",
      productsCount: "6",
      vendorFullame: "Dr. Gonzalo Kertzmann",
      createdAt: '2025-08-08',
    ),
    MarketStoreModel(
      id: 4,
      name: "Stouffer",
      status: "Pending",
      logo: 'assets/images/winter_cap.webp',
      earnings: "456.80\$",
      productsCount: "9",
      vendorFullame: "Prof. Cleta Mueller",
      createdAt: '2025-08-08',
    ),
    MarketStoreModel(
      id: 5,
      name: "Young Shop",
      status: "Rejected",
      logo: 'assets/images/winter_cap.webp',
      earnings: "74.40\$",
      productsCount: "9",
      vendorFullame: "Ms. Marisa Block Jr.",
      createdAt: '2025-08-08',
    ),
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
        DataColumn(
            label: Text(
          "ID",
        )),
        DataColumn(label: Text("Images")),
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Created at")),
        DataColumn(label: Text("Status")),
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
            DataCell(
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: isSelected,
                  side: BorderSide(color: Colors.grey[500]!),
                  onChanged: (val) {
                    setState(() {
                      selected[index] = val!;
                      selectAll = selected.every((s) => s);
                    });
                  },
                ),
              ),
            ),
            DataCell(Text(
              item.id.toString(),
              style: Theme.of(context).textTheme.labelSmall,
            )),
            DataCell(Image.asset(
              item.logo,
              width: 30,
              height: 30,
            )),
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.earnings, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.vendorFullame, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _buildStockStatus(item.status, context),
            _buildActionButtons(context),
          ],
        );
      }),
    );
  }

  static DataCell _buildStockStatus(String status, BuildContext context) {
    Color color;
    switch (status) {
      case 'Rejected':
        color = Colors.red;
        break;
      case 'Pending':
        color = Colors.orange;
        break;
      default:
        color = Colors.green;
    }
    return DataCell(Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
      child: SizedBox(
          width: 94,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: color,
                ),
                SizedBox(width: 2),
                Expanded(child: Text(status, style: Theme.of(context).textTheme.labelSmall)),
              ],
            ),
          )),
    ));
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

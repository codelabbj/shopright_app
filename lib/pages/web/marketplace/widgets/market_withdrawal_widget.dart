import 'package:e_com_app/models/market_store_model.dart';
import 'package:e_com_app/models/page_item_model.dart';
import 'package:e_com_app/models/withdrawal_%20model.dart';
import 'package:flutter/material.dart';

import '../../../../models/gallerie_model.dart';
import '../../../../utils/utils.dart';

class MarketWithdrawalWidget extends StatefulWidget {
  const MarketWithdrawalWidget({Key? key}) : super(key: key);

  @override
  State<MarketWithdrawalWidget> createState() => _MarketWithdrawalWidgetState();
}

class _MarketWithdrawalWidgetState extends State<MarketWithdrawalWidget> {
  List<WithdrawalModel> items = [
    WithdrawalModel(
      id: 1,
      vendor: "Elliott Durgan",
      status: "Completed",
      amount: "2300.00\$",
      fee: "\$0.00",
      createdAt: '2025-08-08',
    ),
    WithdrawalModel(
      id: 2,
      vendor: "Elliott Durgan",
      status: "Pending",
      amount: "670.00\$",
      fee: "\$0.00",
      createdAt: '2025-08-08',
    ),
    WithdrawalModel(
      id: 3,
      vendor: "Prof. Cleta Mueller",
      status: "Completed",
      amount: "2300.00\$",
      fee: "\$0.00",
      createdAt: '2025-08-08',
    ),
    WithdrawalModel(
      id: 4,
      vendor: "Elliott Durgan",
      status: "Processing",
      amount: "2300.00\$",
      fee: "\$0.00",
      createdAt: '2025-08-08',
    ),
    WithdrawalModel(
      id: 5,
      vendor: "Dr. Gonzalo Kertzmann",
      status: "Processing",
      amount: "2300.00\$",
      fee: "\$0.00",
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
        DataColumn(label: Text("Vendor")),
        DataColumn(label: Text("Amount")),
        DataColumn(label: Text("Fee")),
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
            DataCell(Text(item.vendor, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.amount, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.fee, style: Theme.of(context).textTheme.labelSmall)),
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
      case 'Processing':
        color = Colors.blue;
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

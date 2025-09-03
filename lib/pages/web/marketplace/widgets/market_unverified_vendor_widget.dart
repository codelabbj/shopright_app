import 'package:flutter/material.dart';

import '../../../../models/vendor_model.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/utils.dart';

class MarketUnverifiedVendorWidget extends StatefulWidget {
  const MarketUnverifiedVendorWidget({Key? key}) : super(key: key);

  @override
  State<MarketUnverifiedVendorWidget> createState() => _MarketUnverifiedVendorWidgetState();
}

class _MarketUnverifiedVendorWidgetState extends State<MarketUnverifiedVendorWidget> {
  List<VendorModel> items = [
    VendorModel(
      id: 2,
      name: "Dameon Zboncak DVM	Dameon Zboncak DVM",
      status: "No",
      createdAt: '2025-08-08',
      avatar: 'assets/images/winter_cap.webp',
      balance: 0.00,
      storeName: '__',
      storePhone: '__',
      product: '3',
      totalRevenue: '\$0.00',
      email: 'meaghan56@example.org',
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
        DataColumn(label: Text("Avatar")),
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Email")),
        DataColumn(label: Text("Store Name")),
        DataColumn(label: Text("Store Phone")),
        DataColumn(label: Text("Products")),
        DataColumn(label: Text("Total Revenue")),
        DataColumn(label: Text("Balance")),
        DataColumn(label: Text("Verified")),
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
              item.avatar,
              width: 30,
              height: 30,
            )),
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.email, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.storeName, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.storePhone, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(color: AppColors.PRIMARY_BLUE_COLOR, borderRadius: BorderRadius.circular(6)),
                child:
                    Text(item.product, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)))),
            DataCell(Text(item.totalRevenue, style: Theme.of(context).textTheme.labelSmall)),
            _buildStockBalance(item.balance, context),
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
      case 'No':
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

  static DataCell _buildStockBalance(double balance, BuildContext context) {
    Color color;
    switch (balance) {
      case 0.00:
        color = Colors.blue;
        break;
      default:
        color = Colors.green;
    }
    return DataCell(Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            // Icon(
            //   Icons.circle,
            //   size: 10,
            //   color: color,
            // ),
            SizedBox(width: 2),
            Expanded(child: Text("\$${balance}.00", style: Theme.of(context).textTheme.labelSmall)),
          ],
        ),
      ),
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

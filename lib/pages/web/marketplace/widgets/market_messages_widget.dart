import 'package:e_com_app/models/market_message_model.dart';
import 'package:e_com_app/models/market_store_model.dart';
import 'package:e_com_app/models/page_item_model.dart';
import 'package:e_com_app/models/withdrawal_%20model.dart';
import 'package:flutter/material.dart';

import '../../../../models/gallerie_model.dart';
import '../../../../utils/utils.dart';

class MarketMessagesWidget extends StatefulWidget {
  const MarketMessagesWidget({Key? key}) : super(key: key);

  @override
  State<MarketMessagesWidget> createState() => _MarketMessagesWidgetState();
}

class _MarketMessagesWidgetState extends State<MarketMessagesWidget> {
  List<MarketMessageModel> items = [];

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
        DataColumn(label: Text("Nme")),
        DataColumn(label: Text("Email")),
        DataColumn(label: Text("Content")),
        DataColumn(label: Text("Created at")),
        DataColumn(label: Text("Actions")),
      ],
      rows: items.isEmpty
          ? [
              DataRow(
                cells: [
                  ...List.generate(3, (_) => const DataCell(SizedBox())),
                  DataCell(
                    Container(
                      height: 100, // Ajuste si nécessaire
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'No data to display',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.grey[600],
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  // Les autres colonnes vides
                  ...List.generate(3, (_) => const DataCell(SizedBox())),
                ],
              )
            ]
          : List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = selected[index];
              return DataRow(
                selected: isSelected,
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
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
                  DataCell(Text(item.name,
                      style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.email,
                      style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.content,
                      style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.createdAt,
                      style: Theme.of(context).textTheme.labelSmall)),
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
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.red),
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

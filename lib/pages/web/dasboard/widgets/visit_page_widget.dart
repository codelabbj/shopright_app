import 'package:flutter/material.dart';

import '../../../../models/visit_model.dart';
import 'visit_page_row.dart';

class TopVisitPagesWidget extends StatefulWidget {
  final List<VisitPageStat> data;

  const TopVisitPagesWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<TopVisitPagesWidget> createState() => _TopVisitPagesWidgetState();
}

class _TopVisitPagesWidgetState extends State<TopVisitPagesWidget> {
  String selectedFilter = "Today";

  final List<String> filters = ["Today", "Yesterday", "This Week", "Last 7 Days", "This Month", "Last 30 Days", "This Year"];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: Text("Top Most Visit Pages"),
            trailing: DropdownButton<String>(
              value: selectedFilter,
              underline: SizedBox(),
              items: filters.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
            ),
          ),
          Divider(),
          DataTable(
            columnSpacing: 12,
            headingRowHeight: 0,
            columns: const [
              DataColumn(label: SizedBox()),
              DataColumn(label: Text("URL")),
              DataColumn(label: Text("")),
            ],
            rows: List.generate(widget.data.length, (index) {
              final stat = widget.data[index];
              return DataRow(
                cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Text(stat.title, overflow: TextOverflow.ellipsis)),
                  DataCell(Text(stat.views?.toString() ?? '')),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

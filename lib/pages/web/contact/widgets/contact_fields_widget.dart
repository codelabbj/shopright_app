import 'package:flutter/material.dart';

class ContactFieldsWidget extends StatelessWidget {
  const ContactFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Mimic market_messages empty state table
    return DataTable(
      columnSpacing: 12,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: const [
        DataColumn(label: Text('')), // checkbox column placeholder
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Type')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Operations')),
      ],
      rows: [
        DataRow(
          cells: [
            const DataCell(SizedBox()),
            const DataCell(SizedBox()),
            const DataCell(SizedBox()),
            const DataCell(SizedBox()),
            DataCell(
              Container(
                height: 100,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'No data to display',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
            ),
            const DataCell(SizedBox()),
          ],
        ),
      ],
    );
  }
}



import 'package:flutter/material.dart';

class NewslettersWidget extends StatelessWidget {
  const NewslettersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: const [
        DataColumn(label: Text('')),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
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
            const DataCell(SizedBox()),
          ],
        ),
      ],
    );
  }
}



import 'package:flutter/material.dart';

import '../../../../models/ad_model.dart';
import '../../../../utils/utils.dart';

class AdsListWidget extends StatefulWidget {
  const AdsListWidget({Key? key}) : super(key: key);

  @override
  State<AdsListWidget> createState() => _AdsListWidgetState();
}

class _AdsListWidgetState extends State<AdsListWidget> {
  final List<AdModel> items = const [
    AdModel(id: 7, name: 'Ads 7', imageAsset: 'assets/images/mobile-shopping-app.png', shortcode: '[ads key="IHPZ2WBSYJUK"][/ads]', clicked: 0, expiredAt: '2030-08-08', status: 'Published'),
    AdModel(id: 6, name: 'Ads 6', imageAsset: 'assets/images/mobile-shopping-app.jpg', shortcode: '[ads key="F1LTQS976YPY"][/ads]', clicked: 0, expiredAt: '2030-08-08', status: 'Published'),
    AdModel(id: 5, name: 'Ads 5', imageAsset: 'assets/images/mobile-shopping-app.png', shortcode: '[ads key="B5ZA76ZWMMAE"][/ads]', clicked: 0, expiredAt: '2030-08-08', status: 'Published'),
    AdModel(id: 4, name: 'Ads 4', imageAsset: 'assets/images/mobile-shopping-app.jpg', shortcode: '[ads key="QGPRRJ2MPZYA"][/ads]', clicked: 0, expiredAt: '2030-08-08', status: 'Published'),
  ];

  late List<bool> selected;

  @override
  void initState() {
    super.initState();
    selected = List<bool>.generate(items.length, (_) => false);
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
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Shortcode')),
        DataColumn(label: Text('Clicked')),
        DataColumn(label: Text('Expired at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final AdModel item = items[index];
        final bool isSelected = selected[index];
        return DataRow(
          selected: isSelected,
          color: MaterialStateProperty.resolveWith<Color?>((states) => isSelected ? Colors.blue[100] : null),
          cells: [
            DataCell(
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: isSelected,
                  side: BorderSide(color: Colors.grey[500]!),
                  onChanged: (val) => setState(() => selected[index] = val ?? false),
                ),
              ),
            ),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.asset(item.imageAsset, width: 46, height: 46, fit: BoxFit.cover))),
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Row(children: [
              Expanded(child: Text(item.shortcode, style: Theme.of(context).textTheme.labelSmall)),
              const SizedBox(width: 6),
              const Icon(Icons.copy, size: 18, color: Colors.blue),
            ])),
            DataCell(Text(item.clicked.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.expiredAt, style: Theme.of(context).textTheme.labelSmall)),
            _statusCell(item.status, context),
            _actionCell(context),
          ],
        );
      }),
    );
  }

  static DataCell _statusCell(String status, BuildContext context) {
    final Color color = Colors.green;
    return DataCell(Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
      child: SizedBox(
        width: 94,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Icon(Icons.circle, size: 10, color: color),
              const SizedBox(width: 2),
              Expanded(child: Text(status, style: Theme.of(context).textTheme.labelSmall)),
            ],
          ),
        ),
      ),
    ));
  }

  static DataCell _actionCell(BuildContext context) {
    return DataCell(
      IconButton(
        icon: Row(
          children: [
            Image.asset('assets/images/supprimer.png', width: 15, height: 15, color: Colors.red),
            const SizedBox(width: 5),
            Text('Delete', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red)),
          ],
        ),
        onPressed: () => Utils.showDeleteDialog(context),
      ),
    );
  }
}



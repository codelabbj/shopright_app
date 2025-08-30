import 'package:flutter/material.dart';
import '../../../../models/visit_model.dart';

class VisitPageRow extends StatelessWidget {
  final VisitPageStat stat;
  final int index;

  const VisitPageRow({Key? key, required this.stat, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(stat.title, style: Theme.of(context).textTheme.labelSmall)),
          Expanded(flex: 3, child: Text(stat.views.toString(), style: Theme.of(context).textTheme.labelSmall)),
        ],
      ),
    );
  }
}

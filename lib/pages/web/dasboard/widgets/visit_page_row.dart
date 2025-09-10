import 'package:flutter/material.dart';
import '../../../../models/visit_model.dart';

class VisitPageRow extends StatelessWidget {
  final VisitPageStat stat;
  final int index;

  const VisitPageRow({Key? key, required this.stat, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
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

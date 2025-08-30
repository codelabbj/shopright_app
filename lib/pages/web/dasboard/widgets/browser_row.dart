import 'package:flutter/material.dart';
import '../../../../models/browser_stat_model.dart';

class BrowserRow extends StatelessWidget {
  final BrowserStat stat;
  final int index;

  const BrowserRow({Key? key, required this.stat, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(stat.name, style: Theme.of(context).textTheme.labelSmall)),
          Expanded(flex: 3, child: Text(stat.sessions.toString(), style: Theme.of(context).textTheme.labelSmall)),
        ],
      ),
    );
  }
}

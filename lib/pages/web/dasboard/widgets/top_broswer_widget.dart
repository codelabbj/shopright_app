import 'package:flutter/material.dart';

import '../../../../models/browser_stat_model.dart';
import 'browser_row.dart';

class TopBrowsersWidget extends StatefulWidget {
  final List<BrowserStat> data;

  const TopBrowsersWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<TopBrowsersWidget> createState() => _TopBrowsersWidgetState();
}

class _TopBrowsersWidgetState extends State<TopBrowsersWidget> {
  String selectedFilter = "Today";

  final List<String> filters = ["Today", "Yesterday", "This Week", "Last 7 Days", "This Month", "Last 30 Days", "This Year"];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: Text("Top Browsers"),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: List.generate(widget.data.length, (index) {
                return BrowserRow(stat: widget.data[index], index: index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

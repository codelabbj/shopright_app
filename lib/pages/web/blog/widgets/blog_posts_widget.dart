import 'package:flutter/material.dart';

import '../../../../models/blog_post_model.dart';
import '../../../../utils/utils.dart';

class BlogPostsWidget extends StatefulWidget {
  const BlogPostsWidget({Key? key}) : super(key: key);

  @override
  State<BlogPostsWidget> createState() => _BlogPostsWidgetState();
}

class _BlogPostsWidgetState extends State<BlogPostsWidget> {
  final List<BlogPostModel> items = [
    BlogPostModel(
      id: 1,
      title: "4 Expert Tips On How To Choose The Right Men's Wallet",
      imageUrl: 'assets/images/mobile-shopping-app.jpg',
      categories: const ["Ecological", "Fashion"],
      author: 'Darius Brakus',
      createdAt: '2025-08-08',
      status: 'Published',
    ),
    BlogPostModel(
      id: 2,
      title: "Sexy Clutches: How to Buy & Wear a Designer Clutch Bag",
      imageUrl: 'assets/images/footwear.jpg',
      categories: const ["Ecological", "Fashion"],
      author: 'Darius Brakus',
      createdAt: '2025-08-08',
      status: 'Published',
    ),
    BlogPostModel(
      id: 3,
      title: "The Top 2020 Handbag Trends to Know",
      imageUrl: 'assets/images/school_bag.jpg',
      categories: const ["Commercial"],
      author: 'Darius Brakus',
      createdAt: '2025-08-08',
      status: 'Published',
    ),
  ];

  late List<bool> selected;
  bool selectAll = false;

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
      columns: [
        DataColumn(
          label: Transform.scale(
            scale: 0.7,
            child: Checkbox(
              value: selectAll,
              side: BorderSide(color: Colors.grey[500]!),
              onChanged: (value) {
                setState(() {
                  selectAll = value ?? false;
                  for (int i = 0; i < selected.length; i++) {
                    selected[i] = selectAll;
                  }
                });
              },
            ),
          ),
        ),
        const DataColumn(label: Text('ID')),
        const DataColumn(label: Text('Image')),
        const DataColumn(label: Text('Name')),
        const DataColumn(label: Text('Categories')),
        const DataColumn(label: Text('Author')),
        const DataColumn(label: Text('Created at')),
        const DataColumn(label: Text('Status')),
        const DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final BlogPostModel item = items[index];
        final bool isSelected = selected[index];
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
                      selected[index] = val ?? false;
                      selectAll = selected.every((s) => s);
                    });
                  },
                ),
              ),
            ),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(item.imageUrl, width: 46, height: 46, fit: BoxFit.cover),
              ),
            ),
            DataCell(SizedBox(width: 320, child: Text(item.title, style: Theme.of(context).textTheme.labelSmall))),
            DataCell(Text(item.categories.join(', '), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.author, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _buildStatusCell(item.status, context),
            _buildActionButtons(context),
          ],
        );
      }),
    );
  }

  static DataCell _buildStatusCell(String status, BuildContext context) {
    Color color = Colors.green;
    if (status == 'Draft') color = Colors.grey;
    if (status == 'Pending') color = Colors.orange;
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
          )),
    ));
  }

  static DataCell _buildActionButtons(BuildContext context) {
    return DataCell(
      IconButton(
        icon: Row(
          children: [
            Image.asset('assets/images/supprimer.png', width: 15, height: 15, color: Colors.red),
            const SizedBox(width: 5),
            Text('Delete', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red)),
          ],
        ),
        onPressed: () {
          Utils.showDeleteDialog(context);
        },
      ),
    );
  }
}



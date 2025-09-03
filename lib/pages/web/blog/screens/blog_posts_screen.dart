import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../pages-section/widgets/filter_widget.dart';
import '../widgets/blog_posts_widget.dart';

class BlogPostsScreen extends StatefulWidget {
  const BlogPostsScreen({super.key});

  @override
  State<BlogPostsScreen> createState() => _BlogPostsScreenState();
}

class _BlogPostsScreenState extends State<BlogPostsScreen> {
  bool isFilterVisible = false;
  String selectedStatus = "Status";
  String selectedCondition = "Less than";
  String selectedValue = "Draft";
  final List<Widget> additionalFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 60, child: AppbarDashboard()),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text("Dashboard/ ", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text("Blog / Posts", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Visibility(
                            visible: isFilterVisible,
                            child: FilterPanelWidget(
                              selectedStatus: selectedStatus,
                              selectedCondition: selectedCondition,
                              selectedValue: selectedValue,
                              onStatusChanged: (val) => setState(() => selectedStatus = val ?? "Status"),
                              onConditionChanged: (val) => setState(() => selectedCondition = val ?? "Less than"),
                              onValueChanged: (val) => setState(() => selectedValue = val ?? "Draft"),
                              onApply: () {},
                              onClose: () => setState(() => isFilterVisible = false),
                              additionalFilters: additionalFilters,
                              onAddFilter: () {},
                            ),
                          ),
                          SizedBox(
                            height: 900,
                            child: CardListWidget(
                              buttons: [
                                const CustomSearchWidget(),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () => setState(() => isFilterVisible = !isFilterVisible),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/images/filtre.png', width: 18, height: 18, color: Colors.black),
                                        const SizedBox(width: 10),
                                        Text('Filter', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              actions: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/reload.png', width: 18, height: 18, color: Colors.black),
                                      const SizedBox(width: 10),
                                      Text('Reload', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const SizedBox(width: 10),
                              ],
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                                  child: const BlogPostsWidget(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



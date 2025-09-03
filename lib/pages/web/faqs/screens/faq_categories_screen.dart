import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../widgets/faq_categories_widget.dart';

class FaqCategoriesScreen extends StatelessWidget {
  const FaqCategoriesScreen({super.key});

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
                        Text("FAQs / Categories", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 600,
                          child: CardListWidget(
                            buttons: const [CustomSearchWidget()],
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
                            ],
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                                child: const FaqCategoriesWidget(),
                              ),
                            ),
                          ),
                        ),
                      ],
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



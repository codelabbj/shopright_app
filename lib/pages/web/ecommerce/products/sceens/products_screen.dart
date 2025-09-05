import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../theme/app_colors.dart';
import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/card_list_widget.dart';
import '../../../../../widgets/custom_search_widget.dart';
import '../../../../../widgets/drawer_widget.dart';
import '../widgets/products_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isFilterVisible = false;

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
                        Text('Dashboard/ ',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text('Ecommerce / Products', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 640,
                            child: CardListWidget(
                              buttons: const [CustomSearchWidget()],
                              actions: [
                                InkWell(
                                  onTap: () {
                                    context.go('/ecommerce/add-product');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: AppColors.PRIMARY_BLUE_COLOR,
                                        border: Border.all(color: Colors.grey[200]!),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(children: [
                                      const Icon(Icons.add, size: 20, color: Colors.white),
                                      const SizedBox(width: 10),
                                      Text("Create",
                                          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                                    ]),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                  child: Row(children: [
                                    Image.asset("assets/images/reload.png", width: 18, height: 18, color: Colors.black),
                                    const SizedBox(width: 10),
                                    Text("Reload", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                                  ]),
                                ),
                              ],
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                                  child: const ProductsWidget(),
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

import 'package:e_com_app/pages/mobile/acceuil/widgets/product_card_widget.dart';
import 'package:e_com_app/widgets/app_bar_widget.dart';
import 'package:e_com_app/widgets/card_list_widget.dart';
import 'package:e_com_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card_widget.dart';

class ListGridProductScreen extends StatefulWidget {
  const ListGridProductScreen({super.key});

  @override
  State<ListGridProductScreen> createState() => _ListGridProductScreenState();
}

class _ListGridProductScreenState extends State<ListGridProductScreen> {
  final List<String> statuses = ["sold_out", "low_stock", "in_stock"];
  @override
  void initState() {
    super.initState();

    // _checkAuthentication();
    // context.read<CollaborateursCubit>().getCustomerDetails();
  }
  //
  // void _checkAuthentication() async {
  //   final token = SharedPreferencesUtils.getString('auth_token');
  //   if (token == null || token.isEmpty) {
  //     // Rediriger vers la page de login
  //     context.go('/login'); // ou Navigator.of(context).pushReplacementNamed('/login');
  //   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Row(
          children: [
            DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 60, child: AppbarDashboard()),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: CardListWidget(
                      title: "Product List",
                      subtitle: "Tracks stocks levels.",
                      actions: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                size: 18,
                              ),
                              Text(
                                "Add Product",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/filtre.png",
                                width: 18,
                                height: 18,
                                color: Colors.black,
                              ),
                              Text(
                                "Filter",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.picture_in_picture_alt_outlined,
                              size: 18, color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(Icons.grid_view,
                                  size: 18, color: Colors.grey),
                              Icon(
                                Icons.table_rows_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: 16,
                          itemBuilder: (context, index) {
                            return ProductCardWidget(
                              imageUrl: "assets/images/winter_hooby.webp",
                              title: "Apple iPad (Gen 10) $index",
                              category: "Smartphone",
                              price: 499.0 + index,
                              stockStatus: statuses[index % 3],
                              onMorePressed: () {
                                print("More options for product $index");
                              },
                            );
                          },
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
    );
  }
}

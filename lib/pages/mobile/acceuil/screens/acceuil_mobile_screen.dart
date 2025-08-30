import 'package:flutter/material.dart';

import '../../../../models/product_model.dart';
import '../widgets/filter_search_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/promo_banner_widget.dart';

class AcceuilMobileScreen extends StatelessWidget {
  const AcceuilMobileScreen({super.key});

  List<ProductModel> get products => [
        ProductModel(name: "Dries Van Noten", price: "\$580", imageUrl: "assets/images/winter_hooby.webp"),
        ProductModel(name: "Wales Bonner", price: "\$280", imageUrl: 'assets/images/clothe.jpeg'),
        ProductModel(name: "Rick Owens", price: "\$650", imageUrl: 'assets/images/winter_hooby.webp'),
        ProductModel(name: "Jacquemus", price: "\$420", imageUrl: "assets/images/winter_cap.webp"),
        ProductModel(name: "Prada", price: "\$720", imageUrl: "assets/images/winter_cap.webp"),
        ProductModel(name: "Balenciaga", price: "\$850", imageUrl: 'assets/images/clothe.jpeg'),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const SizedBox(height: 10),
              FilterSearchWidget(),
              const SizedBox(height: 20),
              const PromoBannerWidget(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Recommended Styles",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  // Spacer(),
                  // Row(
                  //   children: [
                  //     Image.asset(
                  //       "assets/images/marketplace1.png",
                  //       width: 22,
                  //       height: 22,
                  //     ),
                  //   ],
                  // )
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                  children: products.map((product) {
                    return ProductCard(
                      name: product.name ?? "",
                      price: product.price ?? "",
                      imagePath: product.imageUrl ?? "",
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

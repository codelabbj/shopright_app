import 'package:e_com_app/pages/acceuil/widgets/search_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../widgets/filter_bar_widget.dart';
import '../widgets/product_card_widget.dart';

class ListArticlesScreen extends StatelessWidget {
  const ListArticlesScreen({super.key});

  List<ProductModel> get products => [
        ProductModel(
            name: "Dries Van Noten",
            price: "\$580",
            imagePath: "assets/images/winter_hooby.webp"),
        ProductModel(
            name: "Wales Bonner",
            price: "\$280",
            imagePath: 'assets/images/clothe.jpeg'),
        ProductModel(
            name: "Rick Owens",
            price: "\$650",
            imagePath: 'assets/images/winter_hooby.webp'),
        ProductModel(
            name: "Jacquemus",
            price: "\$420",
            imagePath: "assets/images/winter_cap.webp"),
        ProductModel(
            name: "Prada",
            price: "\$720",
            imagePath: "assets/images/winter_cap.webp"),
        ProductModel(
            name: "Balenciaga",
            price: "\$850",
            imagePath: 'assets/images/clothe.jpeg'),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              SizedBox(height: 8),
              FilterBarWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                  children: products.map((product) {
                    return ProductCard(
                      name: product.name,
                      price: product.price,
                      imagePath: product.imagePath,
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

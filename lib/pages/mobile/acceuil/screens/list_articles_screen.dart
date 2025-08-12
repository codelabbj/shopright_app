import 'package:flutter/material.dart';

import '../../../../constantes/const.dart';
import '../../../../models/product_model.dart';

import '../../Home/home_mobile_screen.dart';
import '../widgets/filter_bar_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/search_widget.dart';

class ListArticlesScreen extends StatelessWidget {
  const ListArticlesScreen({super.key});

  List<ProductModel> get products => [
        ProductModel(name: "Dries Van Noten", price: "\$580", imagePath: "assets/images/winter_hooby.webp"),
        ProductModel(name: "Wales Bonner", price: "\$280", imagePath: 'assets/images/clothe.jpeg'),
        ProductModel(name: "Rick Owens", price: "\$650", imagePath: 'assets/images/winter_hooby.webp'),
        ProductModel(name: "Jacquemus", price: "\$420", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Prada", price: "\$720", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Balenciaga", price: "\$850", imagePath: 'assets/images/clothe.jpeg'),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Const.screenWidth(context) * 0.33,
        leading: SizedBox(
          height: 40,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, size: 22)),
                  SizedBox(width: 6),
                  Text("Back", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
      ),
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

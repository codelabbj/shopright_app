import 'package:e_com_app/pages/web/product/widgets/product_card_widget.dart';
import 'package:flutter/cupertino.dart';

class ProductGridWidget extends StatefulWidget {
  const ProductGridWidget({super.key});

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  final List<String> statuses = ["sold_out", "low_stock", "in_stock"];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return ProductCardWidget(
            imageUrl: "https://via.placeholder.com/150",
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
    );
  }
}

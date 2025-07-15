import 'package:e_com_app/pages/acceuil/screens/checkout_product_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedColor = 0;
  int selectedSize = 1;

  final colors = [Colors.black, Colors.blue, Colors.lightBlue.shade100];
  final sizes = ['XS', 'S', 'M'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Product"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(
                    "3",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 10, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // IMAGE
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Image.asset(
                widget.product.imagePath,
                height: 220,
              ),
            ),
          ),

          // PAGE VIEW INDICATOR (fake)
          const Icon(Icons.more_horiz, size: 20, color: Colors.grey),

          const SizedBox(height: 16),

          // DETAILS
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "H&M",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text("4.9 (136)",
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.product.price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "\$550.00",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Text(
                      "Elevate your casual wardrobe with our Loose Fit Printed T-shirt. Crafted from premium cotton for maximum comfort, this relaxed-fit tee features.",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.grey),
                    ),

                    const SizedBox(height: 16),

                    // Colors
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Colors",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(colors.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() => selectedColor = index);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedColor == index
                                            ? Colors.black
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: colors[index],
                                      radius: 12,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Size",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(sizes.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() => selectedSize = index);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: selectedSize == index
                                          ? Colors.black
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      sizes[index],
                                      style: TextStyle(
                                        color: selectedSize == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                      ],
                    ),

                    // Sizes

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // BOTTOM BUTTONS
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Row(
                      children: [
                        Text(
                          "ADD TO CART",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CheckoutProductScreen(
                            product: ProductModel(
                              name: widget.product.name,
                              price: widget.product.price,
                              imagePath: widget.product.imagePath,
                            ),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      "BUY NOW",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

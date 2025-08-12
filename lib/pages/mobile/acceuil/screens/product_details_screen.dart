import 'package:flutter/material.dart';

import '../../../../constantes/const.dart';
import '../../../../models/product_model.dart';

import '../../Home/home_mobile_screen.dart';
import 'checkout_product_screen.dart';

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
        leadingWidth: Const.screenWidth(context) * 0.33,
        leading: SizedBox(
          height: 40,
          child: GestureDetector(
            onTap: () => HomeScreen(),
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
                  Text("Cart", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
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
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10, color: Colors.white),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.product.price,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Outwear Men",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Selected Size",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Size", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(sizes.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() => selectedSize = index);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedSize == index ? Color(0xFFFF9B00) : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  sizes[index],
                                  style: TextStyle(
                                    color: selectedSize == index ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Elevate your casual wardrobe with our Loose Fit Printed T-shirt. Crafted from premium cotton for maximum comfort, this relaxed-fit tee features.",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
                    ),

                    const SizedBox(height: 16),

                    // Colors
                    // Row(
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text("Colors", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                    //         const SizedBox(height: 8),
                    //         Row(
                    //           children: List.generate(colors.length, (index) {
                    //             return GestureDetector(
                    //               onTap: () {
                    //                 setState(() => selectedColor = index);
                    //               },
                    //               child: Container(
                    //                 margin: const EdgeInsets.only(right: 10),
                    //                 padding: const EdgeInsets.all(4),
                    //                 decoration: BoxDecoration(
                    //                   shape: BoxShape.circle,
                    //                   border: Border.all(
                    //                     color: selectedColor == index ? Colors.black : Colors.transparent,
                    //                     width: 2,
                    //                   ),
                    //                 ),
                    //                 child: CircleAvatar(
                    //                   backgroundColor: colors[index],
                    //                   radius: 12,
                    //                 ),
                    //               ),
                    //             );
                    //           }),
                    //         ),
                    //       ],
                    //     ),
                    //     const SizedBox(width: 30),
                    //
                    //   ],
                    // ),

                    // Sizes

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // BOTTOM BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17))),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                ],
                              )),
                          Text(
                            "Add To Cart",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Color(0xFFFF9B00),
                        foregroundColor: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/shopping-bag.png",
                            width: 30,
                            height: 32,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Buy Now",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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

import 'package:flutter/material.dart';

import '../../../constantes/const.dart';
import '../../../models/product_model.dart';

class CheckoutProductScreen extends StatelessWidget {
  final ProductModel product;

  const CheckoutProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  product.imagePath,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("by Fashion Brand",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall), // Marque fixe ou dynamique
                      const SizedBox(height: 4),
                      Text(product.price,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Icon(Icons.remove)),
                Text(
                  "1",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 40),
            InkWell(
              child: Container(
                  width: Const.screenWidth(context),
                  height: Const.screenHeight(context) * 0.05,
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 12,
                      ),
                      Text("Add Product",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  )),
            ),
            const SizedBox(height: 30),
            const Spacer(),
            // const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal:",
                    style: Theme.of(context).textTheme.labelSmall),
                Text(product.price,
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery:",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text("\$0.00", style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(product.price,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),

            InkWell(
              child: Container(
                  width: Const.screenWidth(context),
                  height: Const.screenHeight(context) * 0.05,
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I have a discount code",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w900)),
                    ],
                  )),
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Container(
                  width: Const.screenWidth(context),
                  height: Const.screenHeight(context) * 0.05,
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pay later with Klarna",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w900)),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  // Image.asset("assets/icons/mastercard.png", height: 24), // ou icône Flutter
                  // const SizedBox(width: 8),
                  // const Text("•• 78"),
                  const Spacer(),
                  SizedBox(
                    width: Const.screenWidth(context) * 0.65,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        // Action de paiement
                      },
                      child: Text(
                        "Confirm payment",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
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

import 'package:e_com_app/pages/Home/home_mobile_screen.dart';
import 'package:e_com_app/pages/card/widgets/card_product_widget.dart';
import 'package:flutter/material.dart';

import '../../../constantes/const.dart';

class CartItemModel {
  final String name;
  final String imageUrl;
  final String size;
  final double unitPrice;
  int quantity;

  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.size,
    required this.unitPrice,
    this.quantity = 1,
  });
}

class ChartMobileScreen extends StatefulWidget {
  @override
  State<ChartMobileScreen> createState() => _ChartMobileScreenState();
}

class _ChartMobileScreenState extends State<ChartMobileScreen> {
  List<CartItemModel> cartItems = [
    CartItemModel(
      name: 'Comme Play Sneakers',
      imageUrl: 'assets/images/winter_hooby.webp',
      size: '40',
      unitPrice: 128,
    ),
    CartItemModel(
      name: 'Button Blazer',
      imageUrl: 'assets/images/winter_cap.webp',
      size: 'XL',
      unitPrice: 1745,
    ),
    CartItemModel(
      name: 'Still Kelly',
      imageUrl: 'assets/images/winter_hooby.webp',
      size: 'XL',
      unitPrice: 330,
    ),
  ];

  double deliveryFee = 60;

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.unitPrice * item.quantity);
  double get total => subtotal + deliveryFee;

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/logo/srtc.png",
              width: 65,
              height: 65,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  'My Cart',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Spacer(),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CardProductWidget(
                  name: item.name,
                  imageUrl: item.imageUrl,
                  size: item.size,
                  unitPrice: item.unitPrice,
                  quantity: item.quantity,
                  onAdd: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      if (item.quantity > 1) item.quantity--;
                    });
                  },
                );
              },
            ),
          ),
          Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                _buildSummaryRow('Subtotal', subtotal),
                _buildSummaryRow('Delivery Fee', deliveryFee),
                SizedBox(height: 10),
                _buildSummaryRow('Total', total, isBold: true),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Commander
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Commander', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('\$${amount.toStringAsFixed(2)} USD',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IncompleteOrdersWidget extends StatelessWidget {
  const IncompleteOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 420,
              height: 260,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('assets/images/no-order.png', color: Theme.of(context).brightness == Brightness.dark ? Colors.white24 : null),
              ),
            ),
            const SizedBox(height: 8),
            Text('Manage incomplete orders', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            SizedBox(
              width: 620,
              child: Text(
                'Incomplete order is an order created when a customer adds a product to the cart, proceeds to fill out the purchase information but does not complete the checkout process.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}



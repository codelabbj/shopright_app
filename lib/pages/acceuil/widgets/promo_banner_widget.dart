import 'package:flutter/material.dart';

class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFF9B00),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("UP TO 25% OFF", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("ENDS SOON", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text("Shop Now", style: Theme.of(context).textTheme.labelSmall),
                )
              ],
            ),
          ),
          Image(
            image: AssetImage("assets/images/clothe.jpeg"),
            height: 100,
          )
        ],
      ),
    );
  }
}

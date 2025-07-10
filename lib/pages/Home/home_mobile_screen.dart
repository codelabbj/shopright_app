import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constantes/const.dart';
import '../../models/product_model.dart';
import '../acceuil/screens/acceuil_mobile_screen.dart';
import '../acceuil/widgets/header_widget.dart';
import '../acceuil/widgets/product_card_widget.dart';
import '../acceuil/widgets/promo_banner_widget.dart';
import '../acceuil/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget content = const AcceuilMobileScreen();

  List<ProductModel> get products => [
        ProductModel(name: "Dries Van Noten", price: "\$580", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Wales Bonner", price: "\$280", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Rick Owens", price: "\$650", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Jacquemus", price: "\$420", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Prada", price: "\$720", imagePath: "assets/images/winter_cap.webp"),
        ProductModel(name: "Balenciaga", price: "\$850", imagePath: "assets/images/winter_cap.webp"),
      ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: content,
      ),
      bottomNavigationBar: PhysicalModel(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black26,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(Const.bottomList.length, (index) {
              final item = Const.bottomList[index];
              final bool isSelected = index == currentIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    content = item["screen"];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item[isSelected ? "active_icon" : "icon"],
                      width: isSelected ? 26 : 22,
                      height: isSelected ? 26 : 22,
                      color: isSelected ? const Color(0xFFFF9B00) : Colors.black,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["label"] ?? "",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? const Color(0xFFFF9B00) : Colors.black,
                          ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

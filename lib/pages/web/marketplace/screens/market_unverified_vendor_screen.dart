import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/drawer_widget.dart';

import '../widgets/market_unverified_vendor_widget.dart';
import '../widgets/market_vendors_widget.dart';

class MarketUnverifiedVendorScreen extends StatefulWidget {
  const MarketUnverifiedVendorScreen({super.key});

  @override
  State<MarketUnverifiedVendorScreen> createState() => _MarketUnverifiedVendorScreenState();
}

class _MarketUnverifiedVendorScreenState extends State<MarketUnverifiedVendorScreen> {
  bool isFilterVisible = false;
  final TextEditingController newFilter = TextEditingController();
  String selectedStatus = "Status";
  String selectedCondition = "Less than";
  String selectedValue = "Draft";
  List<Widget> additionalFilters = [];

  int filterCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 60, child: AppbarDashboard()),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text("Dashboard/Marketplace",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text("/Unverified Vendors", style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 900,
                            child: CardListWidget(
                              buttons: [
                                CustomSearchWidget(),
                              ],
                              actions: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/reload.png",
                                        width: 18,
                                        height: 18,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Reload",
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width,
                                  ),
                                  child: MarketUnverifiedVendorWidget(),
                                ),
                              ),
                            ),
                          ),
                        ],
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

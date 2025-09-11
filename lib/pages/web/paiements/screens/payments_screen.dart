import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/app_bar_vendor_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../pages-section/widgets/filter_widget.dart';
import '../widgets/payments_widget.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  bool isFilterVisible = false;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 1150;
    return Scaffold(
      drawer: isLargeScreen ? null : const DrawerDashboard(),
      body: SafeArea(
        child: Row(
          children: [
            if (isLargeScreen) const DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double width = constraints.maxWidth;
                      if (width > 1150) {
                        return const SizedBox(height: 60, child: AppbarDashboard());
                      } else {
                        return const AppBarVendorWidget();
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(children: [
                      Text('Dashboard/ ', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                      Text('Payments / Transactions', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          if (isFilterVisible)
                            FilterPanelWidget(
                              selectedStatus: 'Status',
                              selectedCondition: 'Less than',
                              selectedValue: 'Draft',
                              onApply: () {},
                              onClose: () => setState(() => isFilterVisible = false),
                              onAddFilter: () {},
                              additionalFilters: const [],
                              onStatusChanged: (_) {},
                              onConditionChanged: (_) {},
                              onValueChanged: (_) {},
                            ),
                          SizedBox(
                            height: 640,
                            child: CardListWidget(
                              buttons: [
                                const CustomSearchWidget(),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFilterVisible = !isFilterVisible; // toggle l'affichage
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey[200]!,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/filtre.png",
                                          width: 18,
                                          height: 18,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Filter",
                                          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                              ],
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width,
                                  ),
                                  child: PaymentsWidget(),
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

import 'package:e_com_app/pages/web/dasboard/widgets/stat_card_widget.dart';
import 'package:e_com_app/pages/web/orders/widgets/orders_tab_widget.dart' show OrdersTabWidget;
import 'package:e_com_app/widgets/app_bar_widget.dart';
import 'package:e_com_app/widgets/card_list_widget.dart' show CardListWidget;
import 'package:e_com_app/widgets/drawer_widget.dart' show DrawerDashboard;
import 'package:flutter/material.dart';

import '../widgets/sales_chart_widget.dart';
import '../widgets/top_selling_list_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Row(
          children: [
            DrawerDashboard(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    SizedBox(height: 60, child: AppbarDashboard()),
                    SizedBox(height: 30),
                    Row(
                      children: const [
                        Expanded(
                          child: StatCardWidget(
                            title: "Average Order Value",
                            value: "\$85.70",
                            subtitle: "+150 last month",
                            percentage: "+13.9%",
                            isPositive: true,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: StatCardWidget(
                            title: "Total Income",
                            value: "\$325,890",
                            subtitle: "+500,000 last month",
                            percentage: "+16.1%",
                            isPositive: true,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: StatCardWidget(
                            title: "Conversation Rate",
                            value: "28.5%",
                            subtitle: "+2.3% last month",
                            percentage: "+11.1%",
                            isPositive: true,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: StatCardWidget(
                            title: "Total Orders",
                            value: "9,305",
                            subtitle: "+2,984 last month",
                            percentage: "-10.5%",
                            isPositive: false,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Graphique + produits top ventes
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(child: SalesChartWidget()),
                        SizedBox(width: 16),
                        SizedBox(width: 250, child: TopSellingList()),
                      ],
                    ),
                    Expanded(
                      child: CardListWidget(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                            child: OrdersTabWidget(),
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
    );
  }
}

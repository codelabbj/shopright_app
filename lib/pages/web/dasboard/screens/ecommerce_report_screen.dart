import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../widgets/kpi_metric_card.dart';
import '../widgets/top_selling_list_widget.dart';
import '../widgets/orders_recent_widget.dart';
import '../widgets/ecommerce_overview_widget.dart';
import '../widgets/pie_overview_widget.dart';

class EcommerceReportScreen extends StatelessWidget {
  const EcommerceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(children: [
          const DrawerDashboard(),
          Expanded(
            child: Column(children: [
              const SizedBox(height: 60, child: AppbarDashboard()),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(children: [
                  Text('Dashboard/ ', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                  Text('Ecommerce / Report', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      // KPI grid responsive
                      LayoutBuilder(builder: (ctx, c) {
                        final w = c.maxWidth;
                        final crossAxisCount = w > 1400 ? 4 : w > 1000 ? 3 : w > 700 ? 2 : 1;
                        return GridView.count(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 2.8,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          children: const [
                            KpiMetricCard(icon: Icons.attach_money, iconBg: Colors.pink, title: 'Revenue', value: '\$0.00', delta: '-102,107 decrease'),
                            KpiMetricCard(icon: Icons.trending_up, iconBg: Colors.green, title: 'Profit', value: '\$0.00', delta: '-102,107 decrease'),
                            KpiMetricCard(icon: Icons.trending_down, iconBg: Colors.red, title: 'Expenses', value: '\$0.00', delta: '-102,107 decrease'),
                            KpiMetricCard(icon: Icons.receipt_long, iconBg: Colors.indigo, title: 'Average Order Value', value: '\$0.00', delta: '-100 decrease'),
                            KpiMetricCard(icon: Icons.shopping_cart_outlined, iconBg: Colors.orange, title: 'Orders', value: '0', delta: '-37 decrease'),
                            KpiMetricCard(icon: Icons.group_outlined, iconBg: Colors.green, title: 'Customers', value: '0', delta: '-10 decrease'),
                            KpiMetricCard(icon: Icons.inventory_2_outlined, iconBg: Colors.blue, title: 'Products', value: '0', delta: '-127 decrease'),
                            KpiMetricCard(icon: Icons.pie_chart_outline_outlined, iconBg: Colors.deepOrange, title: 'Conversion Rate', value: '0.00%', delta: '-100 decrease'),
                          ],
                        );
                      }),

                      const SizedBox(height: 12),
                      // Second row: EcommerceOverview + Pie side by side on large screens
                      LayoutBuilder(builder: (ctx, c) {
                        final wide = c.maxWidth >= 1200;
                        if (!wide) return const EcommerceOverviewWidget();
                        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                          Expanded(flex: 3, child: EcommerceOverviewWidget()),
                          SizedBox(width: 12),
                          Expanded(flex: 2, child: PieOverviewWidget()),
                        ]);
                      }),

                      const SizedBox(height: 12),
                      // Recent Orders + Top Selling side by side
                      LayoutBuilder(builder: (ctx, c) {
                        final narrow = c.maxWidth < 1100;
                        if (narrow) {
                          return Column(children: [
                            RecentOrdersWidget(),
                            const SizedBox(height: 12),
                            TopSellingProductsWidget(),
                          ]);
                        }
                        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(child: RecentOrdersWidget()),
                          const SizedBox(width: 12),
                          Expanded(child: TopSellingProductsWidget()),
                        ]);
                      }),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}



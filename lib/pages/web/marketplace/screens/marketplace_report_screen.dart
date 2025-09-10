import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../dasboard/widgets/top_selling_list_widget.dart';
import '../../dasboard/widgets/orders_recent_widget.dart';

class MarketplaceReportScreen extends StatelessWidget {
  const MarketplaceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  Text('Dashboard/ ', style: theme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                  Text('Marketplace / Reports', style: theme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      // Average commission summary constrained (not full width)
                      Align(alignment: Alignment.centerLeft, child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 460), child: _summaryTile(context))),
                      const SizedBox(height: 12),

                      // A couple of compact widgets from dashboard/report
                      LayoutBuilder(builder: (ctx, c) {
                        final narrow = c.maxWidth < 1100;
                        if (narrow) {
                          return Column(children: [
                            OrdersRecentWidgetSafe(),
                            const SizedBox(height: 12),
                            TopSellingProductsWidgetSafe(),
                          ]);
                        }
                        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(child: OrdersRecentWidgetSafe()),
                          const SizedBox(width: 12),
                          Expanded(child: TopSellingProductsWidgetSafe()),
                        ]);
                      }),

                      const SizedBox(height: 12),
                      _card(context, title: 'Store revenues', child: _storeRevenuesTable(context)),

                      const SizedBox(height: 12),
                      _card(context, title: 'Recent Withdrawals', child: _recentWithdrawalsTable(context)),
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

  Widget _summaryTile(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: theme.dividerColor)),
      child: Row(children: [
        Container(width: 36, height: 36, decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.15), borderRadius: BorderRadius.circular(8)), child: Icon(Icons.show_chart, color: theme.colorScheme.primary)),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Average Commission Rate', style: theme.textTheme.displaySmall),
          const SizedBox(height: 4),
          Text('0.00%', style: theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
          Text('Total fee: \$0.00', style: theme.textTheme.displaySmall),
        ])
      ]),
    );
  }

  Widget _card(BuildContext context, {required String title, required Widget child}) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: theme.dividerColor)),
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        child,
      ]),
    );
  }

  Widget _storeGrowthCard(BuildContext context) {
    return _card(
      context,
      title: 'Store Growth',
      child: SizedBox(
        height: 200,
        child: LineChart(LineChartData(borderData: FlBorderData(show: false), titlesData: FlTitlesData(show: false), lineBarsData: [
          LineChartBarData(spots: const [FlSpot(0, 0.1), FlSpot(4, 1)], color: Colors.green, isCurved: true, dotData: const FlDotData(show: false)),
        ])),
      ),
    );
  }

  Widget _productDistributionCard(BuildContext context) {
    final theme = Theme.of(context);
    return _card(
      context,
      title: 'Product Distribution by Store',
      child: SizedBox(
        height: 200,
        child: BarChart(BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 1, color: theme.colorScheme.primary)]),
          ],
        )),
      ),
    );
  }

  Widget _topStores(BuildContext context) {
    final theme = Theme.of(context);
    return Column(children: [
      Row(children: [Expanded(child: Text('Store', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))), SizedBox(width: 60, child: Text('Orders', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))), SizedBox(width: 70, child: Text('Revenue', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)))]),
      const Divider(),
      Row(children: [Expanded(child: Text('Stouffer', style: theme.textTheme.labelSmall)), SizedBox(width: 60, child: Text('1', style: theme.textTheme.labelSmall)), SizedBox(width: 70, child: Text('\$142.45', style: theme.textTheme.labelSmall))]),
    ]);
  }

  Widget _storeRevenuesTable(BuildContext context) {
    final theme = Theme.of(context);
    final headers = ['ID', 'Store', 'Fee', 'Sub Amount', 'Amount', 'Type', 'Created At'];
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.light ? const Color(0xFFF5F7FA) : Theme.of(context).colorScheme.surface, border: Border.all(color: theme.dividerColor)),
        child: Row(children: headers.map((h) => Expanded(child: Text(h, style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)))).toList()),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(children: [
          Expanded(child: Text('#SF-1000049', style: theme.textTheme.labelSmall)),
          Expanded(child: Text('GoPro', style: theme.textTheme.labelSmall)),
          Expanded(child: Text('\$0.00', style: theme.textTheme.labelSmall)),
          Expanded(child: Text('\$9,174.00', style: theme.textTheme.labelSmall)),
          Expanded(child: Text('\$9,174.00', style: theme.textTheme.labelSmall)),
          Expanded(child: Text('Add Amount', style: theme.textTheme.labelSmall)),
          Expanded(child: Text('2025-07-10', style: theme.textTheme.labelSmall)),
        ]),
      ),
    ]);
  }

  Widget _recentWithdrawalsTable(BuildContext context) {
    final theme = Theme.of(context);
    final headers = ['Store', 'Amount', 'Fee', 'Status', 'Created At'];
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.light ? const Color(0xFFF5F7FA) : Theme.of(context).colorScheme.surface, border: Border.all(color: theme.dividerColor)),
        child: Row(children: headers.map((h) => Expanded(child: Text(h, style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)))).toList()),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('No data to display', style: theme.textTheme.displaySmall),
      ),
    ]);
  }
}

// Safe wrappers to decouple marketplace from dashboard file imports where constructor might not be const
class OrdersRecentWidgetSafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RecentOrdersWidget();
}

class TopSellingProductsWidgetSafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TopSellingProductsWidget();
}



import 'package:e_com_app/pages/web/dasboard/widgets/stat_card_widget.dart';
import 'package:e_com_app/widgets/app_bar_widget.dart';
import 'package:e_com_app/widgets/drawer_widget.dart' show DrawerDashboard;
import 'package:flutter/material.dart';

import '../../../../models/browser_stat_model.dart';
import '../../../../models/visit_model.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/app_bar_vendor_widget.dart';
import '../widgets/customers_reviews_widget.dart';
import '../widgets/orders_recent_widget.dart';
import '../widgets/sales_chart_widget.dart';
import '../widgets/top_broswer_widget.dart';
import '../widgets/top_selling_list_widget.dart';
import '../widgets/visit_page_widget.dart';
import '../widgets/ecommerce_overview_widget.dart';
import '../widgets/top_referrers_widget.dart';
import '../widgets/activities_logs_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 1150;
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                        return SizedBox(height: 60, child: AppbarDashboard());
                      } else {
                        return AppBarVendorWidget();
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double width = constraints.maxWidth;

                            if (width > 1024) {
                              // ✅ Desktop layout (comme tu l’avais fait)
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  // Site Analytics (chart)
                                  const SalesChartWidget(),
                                  const SizedBox(height: 16),
                                  // KPI Cards row
                                  Row(
                                    children: [
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Sessions",
                                          value: "661",
                                          color: isLight ? Colors.orangeAccent : theme.colorScheme.primary,
                                          imageUrl: "assets/images/shopping-bag.png",
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Visitors",
                                          value: "566",
                                          imageUrl: "assets/images/user.png",
                                          color: isLight ? Colors.green : theme.colorScheme.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Pageviews",
                                          value: "2,638",
                                          imageUrl: "assets/images/marketing.png",
                                          color: isLight ? Colors.blue : theme.colorScheme.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Bounce Rate",
                                          value: "56%",
                                          color: AppColors.PRIMARY_BLUE_COLOR,
                                          imageUrl: "assets/images/analytics.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // Top Most Visit Pages + Top Browsers
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TopVisitPagesWidget(
                                          data: [
                                            VisitPageStat(title: "MartFury - Laravel Ecommerce system", views: 245),
                                            VisitPageStat(title: "Login", views: 102),
                                            VisitPageStat(title: "Shofy - Multipurpose eCommerce Laravel Script", views: 77),
                                            VisitPageStat(title: "Stories - Laravel Personal Blog Script", views: 70),
                                            VisitPageStat(title: "Phones", views: 69),
                                            VisitPageStat(title: "Nest - Laravel Multipurpose eCommerce Script", views: 54),
                                            VisitPageStat(title: "Products", views: 53),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: TopBrowsersWidget(
                                          data: [
                                            BrowserStat(name: "Chrome", sessions: 538),
                                            BrowserStat(name: "Safari", sessions: 43),
                                            BrowserStat(name: "Firefox", sessions: 39),
                                            BrowserStat(name: "Edge", sessions: 28),
                                            BrowserStat(name: "Opera", sessions: 14),
                                            BrowserStat(name: "(not set)", sessions: 2),
                                            BrowserStat(name: "Android Webview", sessions: 2),
                                            BrowserStat(name: "Samsung Internet", sessions: 1),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // Top Selling Products + Recent Orders
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 2, child: TopSellingProductsWidget()),
                                      const SizedBox(width: 12),
                                      Expanded(child: RecentOrdersWidget()),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // Customer Reviews + Ecommerce side by side, puis Top Referrers + Activities
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 2, child: CustomerReviewsWidget()),
                                      const SizedBox(width: 12),
                                      Expanded(child: EcommerceOverviewWidget()),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Expanded(flex: 2, child: TopReferrersWidget()),
                                      const SizedBox(width: 12),
                                      const Expanded(child: ActivitiesLogsWidget()),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              // ✅ Mobile layout (tout en Column)
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const SalesChartWidget(),
                                  const SizedBox(height: 16),
                                  // Stat cards scroll horizontal
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: StatCardWidget(
                                            title: "Orders",
                                            value: "45",
                                            color: Colors.orangeAccent,
                                            imageUrl: "assets/images/shopping-bag.png",
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        SizedBox(
                                          width: 250,
                                          child: StatCardWidget(
                                            title: "Product",
                                            value: "32",
                                            imageUrl: "assets/images/product.png",
                                            color: Colors.green,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        SizedBox(
                                          width: 250,
                                          child: StatCardWidget(
                                            title: "Customers",
                                            value: "10",
                                            imageUrl: "assets/images/community.png",
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        SizedBox(
                                          width: 250,
                                          child: StatCardWidget(
                                            title: "Reviews",
                                            value: "236",
                                            color: AppColors.PRIMARY_BLUE_COLOR,
                                            imageUrl: "assets/images/responsiveness.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  TopVisitPagesWidget(
                                    data: [
                                      VisitPageStat(title: "MartFury - Laravel Ecommerce system", views: 100),
                                      VisitPageStat(title: "Shofy - Multipurpose eCommerce Laravel Script", views: 75),
                                      VisitPageStat(title: "Login", views: 50),
                                      VisitPageStat(title: "Farmart - Laravel Ecommerce system", views: 30),
                                      VisitPageStat(title: "Flex Home", views: 29),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  TopBrowsersWidget(
                                    data: [
                                      BrowserStat(name: "Chrome", sessions: 364),
                                      BrowserStat(name: "Safari", sessions: 24),
                                      BrowserStat(name: "Edge", sessions: 18),
                                      BrowserStat(name: "Firefox", sessions: 16),
                                      BrowserStat(name: "Opera", sessions: 11),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  TopSellingProductsWidget(),
                                  const SizedBox(height: 16),
                                  RecentOrdersWidget(),
                                  const SizedBox(height: 16),
                                  EcommerceOverviewWidget(),
                                  const SizedBox(height: 16),
                                  TopReferrersWidget(),
                                  const SizedBox(height: 16),
                                  ActivitiesLogsWidget(),
                                  const SizedBox(height: 16),
                                  CustomerReviewsWidget(),
                                  const SizedBox(height: 16),
                                  // InventoryStatusCard(),
                                ],
                              );
                            }
                          },
                        ),
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

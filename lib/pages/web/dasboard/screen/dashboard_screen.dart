import 'package:e_com_app/pages/web/dasboard/widgets/stat_card_widget.dart';
import 'package:e_com_app/pages/web/orders/widgets/orders_tab_widget.dart' show OrdersTabWidget;
import 'package:e_com_app/widgets/app_bar_widget.dart';
import 'package:e_com_app/widgets/card_list_widget.dart' show CardListWidget;
import 'package:e_com_app/widgets/drawer_widget.dart' show DrawerDashboard;
import 'package:flutter/material.dart';

import '../../../../models/browser_stat_model.dart';
import '../../../../models/visit_model.dart';
import '../../../../theme/app_colors.dart';
import '../widgets/customers_reviews_widget.dart';
import '../widgets/orders_recent_widget.dart';
import '../widgets/sales_chart_widget.dart';
import '../widgets/top_broswer_widget.dart';
import '../widgets/top_selling_list_widget.dart';
import '../widgets/visit_page_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_WHITE_LIGHT,
      body: SafeArea(
        child: Row(
          children: [
            DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 60, child: AppbarDashboard()),
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
                                  SizedBox(height: 30),
                                  // Stat cards row
                                  Row(
                                    children: [
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Orders",
                                          value: "45",
                                          color: Colors.orangeAccent,
                                          imageUrl: "assets/images/shopping-bag.png",
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Product",
                                          value: "32",
                                          imageUrl: "assets/images/product.png",
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Customers",
                                          value: "10",
                                          imageUrl: "assets/images/community.png",
                                          color: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: StatCardWidget(
                                          title: "Reviews",
                                          value: "236",
                                          color: AppColors.PRIMARY_BLUE_COLOR,
                                          imageUrl: "assets/images/responsiveness.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 2, child: RecentOrdersWidget()),
                                      Expanded(flex: 1, child: CustomerReviewsWidget()),
                                    ],
                                  ),

                                  // Top selling + Inventory
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: TopSellingProductsWidget(),
                                      ),
                                      // Expanded(flex: 1, child: InventoryStatusCard()),
                                    ],
                                  )
                                ],
                              );
                            } else {
                              // ✅ Mobile layout (tout en Column)
                              return Column(
                                children: [
                                  SizedBox(height: 30),
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
                                  SizedBox(height: 16),
                                  // StoreOverviewCard(),
                                  // Charts en colonne
                                  SalesChartWidget(),
                                  SizedBox(height: 16),
                                  // InventoryPieChart(inStock: 5, lowStock: 4, outOfStock: 2),
                                  TopVisitPagesWidget(
                                    data: [
                                      VisitPageStat(title: "MartFury - Laravel Ecommerce system", views: 100),
                                      VisitPageStat(title: "Shofy - Multipurpose eCommerce Laravel Script", views: 75),
                                      VisitPageStat(title: "Login", views: 50),
                                      VisitPageStat(title: "Farmart - Laravel Ecommerce system", views: 30),
                                      VisitPageStat(title: "Flex Home", views: 29),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  TopBrowsersWidget(
                                    data: [
                                      BrowserStat(name: "Chrome", sessions: 364),
                                      BrowserStat(name: "Safari", sessions: 24),
                                      BrowserStat(name: "Edge", sessions: 18),
                                      BrowserStat(name: "Firefox", sessions: 16),
                                      BrowserStat(name: "Opera", sessions: 11),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  RecentOrdersWidget(),
                                  SizedBox(height: 16),
                                  CustomerReviewsWidget(),
                                  SizedBox(height: 16),
                                  TopSellingProductsWidget(),
                                  SizedBox(height: 16),
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

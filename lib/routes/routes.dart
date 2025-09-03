import 'package:e_com_app/pages/web/annoncement/screens/annoncement_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_messaes_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_stores_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_vendors_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_attributes_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_group_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_table_screen.dart';
import 'package:e_com_app/pages/web/testimonials/widgets/testimonials_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/switch_page/switch_page_cubit.dart';
import '../pages/web/authentification/login_screen.dart';
import '../pages/web/dasboard/screen/dashboard_screen.dart';
import '../pages/web/galleries/screens/galleries_sceen.dart';
import '../pages/web/marketplace/screens/market_unverified_vendor_screen.dart';
import '../pages/web/marketplace/screens/market_withdrawal_screen.dart';
import '../pages/web/orders/screens/list_orders_screen.dart';
import '../pages/web/pages-section/screens/pages_screen.dart';
import '../pages/web/product/screen/add_product_screen.dart';
import '../pages/web/product/screen/product_web_screen.dart';
import '../pages/web/testimonials/screens/testimonals_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/dashboard',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(0);
          return const DashboardScreen();
        },
      ),
      GoRoute(
        path: '/pages',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(4);
          return const PagesScreen();
        },
      ),
      GoRoute(
        path: '/products',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(6);
          return ProductWebScreen();
        },
      ),
      // GoRoute(
      //   path: '/add-product',
      //   builder: (BuildContext context, GoRouterState state) {
      //     context.read<SwitchPageCubit>().switchPage(7);
      //     return const AddProductScreen();
      //   },
      // ),
      GoRoute(
        path: '/galeries',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(7);
          return const GalleriesSceen();
        },
      ),
      GoRoute(
        path: '/testimonials',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8);
          return const TestimonalsScreen();
        },
      ),
      GoRoute(
        path: '/annoncements',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(10);
          return const AnnoncementScreen();
        },
      ),
      GoRoute(
        path: '/orders',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3);
          return ListOrdersScreen();
        },
      ),
      GoRoute(
        path: '/product/groups',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(2.1);
          return ProductGroupScreen();
        },
      ),
      GoRoute(
        path: '/product/attributes',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(2.2);
          return ProductAttributesScreen();
        },
      ),
      GoRoute(
        path: '/product/tables',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(2.3);
          return ProductTableScreen();
        },
      ),

      GoRoute(
        path: '/marketplace/stores',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.2);
          return MarketStoresScreen();
        },
      ),
      GoRoute(
        path: '/marketplace/withdrawals',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.3);
          return MarketWithdrawalScreen();
        },
      ),
      GoRoute(
        path: '/marketplace/vendors',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.4);
          return MarketVendorsScreen();
        },
      ),
      GoRoute(
        path: '/marketplace/unverified-vendors',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.5);
          return MarketUnverifiedVendorScreen();
        },
      ),
      GoRoute(
        path: '/marketplace/messages',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.6);
          return MarketMessaesScreen();
        },
      ),
      GoRoute(
        path: '/promote',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(4);
          return ListOrdersScreen();
        },
      ),
    ],
  );
}

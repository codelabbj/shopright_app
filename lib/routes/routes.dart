import 'package:e_com_app/pages/web/annoncement/screens/annoncement_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/blog_posts_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/blog_tags_screen.dart';
import 'package:e_com_app/pages/web/contact/screens/contact_custom_fields_screen.dart';
import 'package:e_com_app/pages/web/contact/screens/contacts_screen.dart';
import 'package:e_com_app/pages/web/faqs/screens/faq_categories_screen.dart';
import 'package:e_com_app/pages/web/faqs/screens/faqs_screen.dart';
import 'package:e_com_app/pages/web/newsletters/screens/newsletters_screen.dart';
import 'package:e_com_app/pages/web/ads/screens/ads_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/invoices_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/flash_sales_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/customers_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/orders_returns_screen.dart';
// import 'package:e_com_app/pages/web/ecommerce/screens/product_inventory_screen.dart';
// import 'package:e_com_app/pages/web/ecommerce/screens/product_prices_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/shipments_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/product_tags_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/brands_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/product_reviews_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_messaes_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_stores_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_vendors_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_attributes_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_group_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_table_screen.dart';
// import 'package:e_com_app/pages/web/testimonials/widgets/testimonials_widget.dart';
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
import '../pages/web/ecommerce/screens/orders_screen.dart';
import '../pages/web/pages-section/screens/pages_screen.dart';
// import '../pages/web/product/screen/add_product_screen.dart';
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
        path: '/ads',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.1);
          return const AdsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/reports',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.1);
          return const OrdersReturnsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/orders',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.2);
          return const OrdersScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/order-incomplete',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.3);
          return const InvoicesScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/order-returns',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.4);
          return const OrdersReturnsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/shipments',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.5);
          return const ShipmentsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/invoices',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.6);
          return const InvoicesScreen();
        },
      ),

      GoRoute(
        path: '/ecommerce/product-tags',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.10);
          return const ProductTagsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/brands',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.14);
          return const BrandsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/reviews',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.15);
          return const ProductReviewsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/flash-sales',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.16);
          return const FlashSalesScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/customers',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.18);
          return const CustomersScreen();
        },
      ),
      GoRoute(
        path: '/contacts',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(6.1);
          return const ContactsScreen();
        },
      ),
      GoRoute(
        path: '/contacts/custom-fields',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(6.2);
          return const ContactCustomFieldsScreen();
        },
      ),
      GoRoute(
        path: '/newsletters',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(12);
          return const NewslettersScreen();
        },
      ),
      GoRoute(
        path: '/blog/posts',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(5.1);
          return const BlogPostsScreen();
        },
      ),
      GoRoute(
        path: '/blog/tags',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(5.3);
          return const BlogTagsScreen();
        },
      ),
      GoRoute(
        path: '/faqs',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(11.1);
          return const FaqsScreen();
        },
      ),
      GoRoute(
        path: '/faqs/categories',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(11.2);
          return const FaqCategoriesScreen();
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

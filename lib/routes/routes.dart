import 'package:e_com_app/pages/web/annoncement/screens/annoncement_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/blog_posts_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/blog_tags_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/create_blog_tag_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/create_blog_post_screen.dart';
import 'package:e_com_app/pages/web/blog/screens/create_blog_category_screen.dart';
import 'package:e_com_app/pages/web/contact/screens/contact_custom_fields_screen.dart';
import 'package:e_com_app/pages/web/contact/screens/contacts_screen.dart';
import 'package:e_com_app/pages/web/contact/screens/create_contact_custom_field_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/brands-reviews/screens/create_brand_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/brands-reviews/screens/create_review_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/flash-customers/screens/create_customer_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/flash-customers/screens/create_flash_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/products/sceens/add_product_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/products/sceens/product_categorie_screen.dart';
import 'package:e_com_app/pages/web/faqs/screens/faq_categories_screen.dart';
import 'package:e_com_app/pages/web/faqs/screens/faqs_screen.dart';
import 'package:e_com_app/pages/web/faqs/screens/create_faq_category_screen.dart';
import 'package:e_com_app/pages/web/faqs/screens/create_faq_screen.dart';
import 'package:e_com_app/pages/web/newsletters/screens/newsletters_screen.dart';
import 'package:e_com_app/pages/web/ads/screens/ads_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/invoices_screen.dart';

import 'package:e_com_app/pages/web/ecommerce/flash-customers/screens/customers_screen.dart';

import 'package:e_com_app/pages/web/ecommerce/screens/shipments_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/screens/product_tags_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/brands-reviews/screens/brands_screen.dart';
import 'package:e_com_app/pages/web/ecommerce/brands-reviews/screens/product_reviews_screen.dart';
import 'package:e_com_app/pages/web/marketplace/messages_widrawal/screens/market_messaes_screen.dart';
import 'package:e_com_app/pages/web/marketplace/screens/market_stores_screen.dart';

import 'package:e_com_app/pages/web/marketplace/screens/create_store_screen.dart';

import 'package:e_com_app/pages/web/product-specification/screens/product_attributes_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_group_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/product_table_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/create_product_group_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/create_product_attribute_screen.dart';
import 'package:e_com_app/pages/web/product-specification/screens/create_product_table_screen.dart';
// import 'package:e_com_app/pages/web/testimonials/widgets/testimonials_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/switch_page/switch_page_cubit.dart';
import '../pages/web/authentification/login_screen.dart';
import '../pages/web/dasboard/screen/dashboard_screen.dart';
import '../pages/web/ecommerce/flash-customers/screens/flash_sales_screen.dart';
import '../pages/web/ecommerce/orders/screens/orders_returns_screen.dart';
import '../pages/web/ecommerce/orders/screens/orders_screen.dart';
import '../pages/web/ecommerce/orders/screens/create_order_screen.dart';

import '../pages/web/ecommerce/products/sceens/add_product_tag_screen.dart';
import '../pages/web/ecommerce/products/sceens/products_screen.dart';
import '../pages/web/galleries/screens/galleries_sceen.dart';
import '../pages/web/marketplace/vendors-unverified/screens/market_unverified_vendor_screen.dart';
import '../pages/web/marketplace/messages_widrawal/screens/market_withdrawal_screen.dart';
import '../pages/web/marketplace/vendors-unverified/screens/market_vendors_screen.dart';
import '../pages/web/orders/screens/list_orders_screen.dart';

import '../pages/web/pages-section/screens/pages_screen.dart';
// import '../pages/web/product/screen/add_product_screen.dart';
import '../pages/web/pages-section/screens/create_page_screen.dart';
import '../pages/web/paiements/screens/payment_logs_screen.dart';
import '../pages/web/paiements/screens/payments_screen.dart';
import '../pages/web/ecommerce/orders/screens/incomplete_orders_screen.dart';
import '../pages/web/product/screen/product_web_screen.dart';
import '../pages/web/testimonials/screens/testimonals_screen.dart';
import '../pages/web/locations/screens/countries_screen.dart';
import '../pages/web/locations/screens/states_screen.dart';
import '../pages/web/locations/screens/cities_screen.dart';
import '../pages/web/system/screens/system_admin_screen.dart';
import '../pages/web/system/screens/users_screen.dart';
import '../pages/web/system/screens/roles_screen.dart';
import '../pages/web/system/screens/request_logs_screen.dart';
import '../pages/web/system/screens/activities_logs_screen.dart';
import '../pages/web/system/screens/cache_management_screen.dart';
import '../pages/web/settings/screens/settings_overview_screen.dart';
import '../pages/web/settings/screens/settings_general_screen.dart';
import '../pages/web/settings/screens/settings_languages_screen.dart';
import '../pages/web/settings/screens/settings_locales_screen.dart';
import '../pages/web/locations/screens/import_locations_screen.dart';
import '../pages/web/tools/screens/export_import_overview_screen.dart';
import '../pages/web/locations/screens/export_locations_screen.dart';
import '../pages/web/locations/screens/create_country_screen.dart';
import '../pages/web/locations/screens/create_city_screen.dart';
import '../pages/web/dasboard/screens/ecommerce_report_screen.dart';
import '../pages/web/marketplace/screens/marketplace_report_screen.dart';

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
        path: '/pages/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(4);
          return const CreatePageScreen();
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
        path: '/ecommerce/report',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.11);
          return const EcommerceReportScreen();
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
        path: '/ecommerce/products',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.7);
          return const ProductsScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/add-product',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.7);
          return const AddProductScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/orders/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.2);
          return const CreateOrderScreen();
        },
      ),
      GoRoute(
        path: '/ecommerce/order-incomplete',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.3);
          return const IncompleteOrdersScreen();
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
        path: '/ecommerce/product-categorie',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.9);
          return const ProductCategorieScreen();
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
        path: '/ecommerce/product-tags/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.10);
          return const AddProductTagScreen();
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
        path: '/ecommerce/brands/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.14);
          return const CreateBrandScreen();
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
        path: '/ecommerce/reviews/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.15);
          return const CreateReviewScreen();
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
        path: '/ecommerce/flash-sales/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.16);
          return const CreateFlashScreen();
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
        path: '/ecommerce/customers/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(1.18);
          return const CreateCustomerScreen();
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
        path: '/contacts/custom-fields/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(6.2);
          return const CreateContactCustomFieldScreen();
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
        path: '/blog/posts/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(5.1);
          return const CreateBlogPostScreen();
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
        path: '/blog/tags/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(5.3);
          return const CreateBlogTagScreen();
        },
      ),
      GoRoute(
        path: '/blog/categories/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(5.2);
          return const CreateBlogCategoryScreen();
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
        path: '/faqs/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(11.1);
          return const CreateFaqScreen();
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
        path: '/faqs/categories/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(11.2);
          return const CreateFaqCategoryScreen();
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
        path: '/product/groups/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(2.1);
          return const CreateProductGroupScreen();
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
        path: '/product/attributes/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(2.2);
          return const CreateProductAttributeScreen();
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
        path: '/product/tables/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(2.3);
          return const CreateProductTableScreen();
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
        path: '/marketplace/report',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.1);
          return const MarketplaceReportScreen();
        },
      ),
      GoRoute(
        path: '/marketplace/stores/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(3.2);
          return const CreateStoreScreen();
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
      GoRoute(
        path: '/system',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.9);
          return const SystemAdminScreen();
        },
      ),
      GoRoute(
        path: '/system/activities-logs',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.9);
          return const ActivitiesLogsScreen();
        },
      ),
      GoRoute(
        path: '/system/cache-management',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.9);
          return const CacheManagementScreen();
        },
      ),
      GoRoute(
        path: '/system/users',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.9);
          return const PlatformUsersScreen();
        },
      ),
      GoRoute(
        path: '/system/roles',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.9);
          return const RolesPermissionsScreen();
        },
      ),
      GoRoute(
        path: '/system/request-logs',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.9);
          return const RequestLogsScreen();
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.8);
          return const SettingsOverviewScreen();
        },
      ),
      GoRoute(
        path: '/settings/general',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.8);
          return const SettingsGeneralScreen();
        },
      ),
      GoRoute(
        path: '/settings/languages',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.8);
          return const SettingsLanguagesScreen();
        },
      ),
      GoRoute(
        path: '/settings/locales',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(9.8);
          return const SettingsLocalesScreen();
        },
      ),
      GoRoute(
        path: '/locations/countries',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.1);
          return const CountriesScreen();
        },
      ),
      GoRoute(
        path: '/locations/states',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.2);
          return const StatesScreen();
        },
      ),
      GoRoute(
        path: '/locations/cities',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.3);
          return const CitiesScreen();
        },
      ),
      GoRoute(
        path: '/locations/importer',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.4);
          return const ImportLocationsScreen();
        },
      ),
      GoRoute(
        path: '/tools/export-import',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.9);
          return const ExportImportOverviewScreen();
        },
      ),
      GoRoute(
        path: '/tools/export-locations',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.5);
          return const ExportLocationsScreen();
        },
      ),
      GoRoute(
        path: '/locations/countries/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.1);
          return const CreateCountryScreen();
        },
      ),
      GoRoute(
        path: '/locations/cities/create',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(8.3);
          return const CreateCityScreen();
        },
      ),
      GoRoute(
        path: '/payments/transactions',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(7.1);
          return const PaymentsScreen();
        },
      ),
      GoRoute(
        path: '/payments/payment-logs',
        builder: (BuildContext context, GoRouterState state) {
          context.read<SwitchPageCubit>().switchPage(7.2);
          return const PaymentLogsScreen();
        },
      ),
    ],
  );
}

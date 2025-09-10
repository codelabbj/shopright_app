import 'package:flutter/material.dart';

class SettingsOverviewWidget extends StatelessWidget {
  const SettingsOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      _SettingsSection(title: 'Common', tiles: [
        _Tile('General', 'View and update your general settings and activate license', Icons.settings_outlined),
        _Tile('Email', 'View and update your email settings and email templates', Icons.email_outlined),
        _Tile('Email rules', 'Configure email rules for validation', Icons.rule_folder_outlined),
        _Tile('Media', 'View and update your media settings', Icons.perm_media_outlined),
        _Tile('Languages', 'View and update your website languages', Icons.language_outlined),
        _Tile('Admin appearance', 'View and update logo, favicon, layout,...', Icons.palette_outlined),
        _Tile('Permalink', 'View and update your permalink settings', Icons.link_outlined),
        _Tile('API Settings', 'View and update your API settings', Icons.api_outlined),
        _Tile('Website Tracking', 'Choose analytics and tracking method.', Icons.track_changes_outlined),
        _Tile('Cache', 'Configure caching for optimized speed', Icons.cached_outlined),
        _Tile('Datatables', 'Settings for datatables', Icons.table_chart_outlined),
        _Tile('Optimize', 'Minify HTML output, inline CSS, remove comments...', Icons.tune_outlined),
        _Tile('Sitemap', 'Manage sitemap configuration', Icons.map_outlined),
      ]),
      SizedBox(height: 16),
      _SettingsSection(title: 'Localization', tiles: [
        _Tile('Locales', 'View, download and import locales', Icons.public_outlined),
        _Tile('Theme Translations', 'Manage the theme translations', Icons.translate_outlined),
        _Tile('Other Translations', 'Manage the other translations', Icons.g_translate_outlined),
      ]),
      SizedBox(height: 16),
      _SettingsSection(title: 'Ecommerce', tiles: [
        _Tile('General', 'View and update your general settings', Icons.settings_suggest_outlined),
        _Tile('Currencies', 'View and update currency settings', Icons.currency_exchange_outlined),
        _Tile('Products', 'View and update your products settings', Icons.shopping_bag_outlined),
        _Tile('Product Search', 'View and update product search settings', Icons.search_outlined),
        _Tile('Digital Products', 'View and update digital products settings', Icons.cloud_download_outlined),
        _Tile('Product Reviews', 'View and update your product reviews settings', Icons.rate_review_outlined),
        _Tile('Shopping', 'View and update your shopping settings', Icons.shopping_cart_outlined),
        _Tile('Checkout', 'View and update checkout settings', Icons.payment_outlined),
        _Tile('Return', 'View and update return settings', Icons.undo_outlined),
        _Tile('Invoices', 'View and update your invoices settings', Icons.receipt_long_outlined),
        _Tile('Shipping Label Template', 'Settings for shipping label template', Icons.local_shipping_outlined),
        _Tile('Taxes', 'View and update your taxes settings', Icons.receipt_outlined),
        _Tile('Shipping', 'View and update shipping settings', Icons.local_shipping_outlined),
        _Tile('Marketplace', 'View and update marketplace settings', Icons.storefront_outlined),
        _Tile('Tracking', 'View and update tracking settings', Icons.location_on_outlined),
        _Tile('Webhook', 'Configure webhook settings', Icons.merge_outlined),
        _Tile('Sale Popup', 'Customize sale popup settings with ease', Icons.campaign_outlined),
        _Tile('Store locators', 'View and update the lists of your chains', Icons.store_outlined),
        _Tile('Invoice Template', 'Settings for Invoice template', Icons.description_outlined),
        _Tile('Customers', 'View and update your customers settings', Icons.groups_outlined),
        _Tile('Standard & Format', 'View and update standard & format settings', Icons.format_align_left_outlined),
        _Tile('Flash Sale', 'View and update flash sale settings', Icons.flash_on_outlined),
      ]),
    ]);
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<_Tile> tiles;
  const _SettingsSection({required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 3))]
            : [],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: tiles.map((t) => _TileCard(t: t)).toList(),
        ),
      ]),
    );
  }
}

class _Tile {
  final String title;
  final String subtitle;
  final IconData icon;
  const _Tile(this.title, this.subtitle, this.icon);
}

class _TileCard extends StatelessWidget {
  final _Tile t;
  const _TileCard({required this.t});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Row(children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(t.icon, size: 20, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t.title, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(t.subtitle, style: Theme.of(context).textTheme.displaySmall),
            ]),
          ),
        ]),
      ),
    );
  }
}



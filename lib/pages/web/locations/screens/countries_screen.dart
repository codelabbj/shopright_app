import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_colors.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/app_bar_vendor_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../widgets/countries_widget.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 1150;
    return Scaffold(
      drawer: isLargeScreen ? null : const DrawerDashboard(),
      body: SafeArea(
        child: Row(children: [
          if (isLargeScreen) const DrawerDashboard(),
          Expanded(
            child: Column(children: [
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
                  Text('Locations / Countries', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 400,
                      child: CardListWidget(
                        buttons: const [CustomSearchWidget()],
                        actions: [
                          InkWell(
                            onTap: () => context.go('/locations/countries/create'),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.PRIMARY_BLUE_COLOR,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(children: [
                                const Icon(Icons.add, size: 18, color: Colors.white),
                                const SizedBox(width: 10),
                                Text('Create',
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                              ]),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).dividerColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(children: [
                              const Icon(Icons.refresh, size: 18),
                              const SizedBox(width: 10),
                              Text('Reload', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ],
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                            child: CountriesWidget(),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

import 'package:e_com_app/pages/web/ecommerce/products/widgets/add_product_tag_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/drawer_widget.dart';
import '../../../product/screen/add_product_info_screen.dart';

import '../widgets/add_product_categ_screen.dart';
import '../widgets/categorie_check_widget.dart';
import '../widgets/filter_add_widget.dart';
import '../widgets/product_form2_widget.dart';

import '../widgets/product_option_widget.dart';
import '../widgets/product_settings_widget.dart';
import '../widgets/upload_files_widget.dart';
import '../widgets/validation_widget.dart';

class AddProductTagScreen extends StatefulWidget {
  const AddProductTagScreen({super.key});

  @override
  State<AddProductTagScreen> createState() => _AddProductTagScreenState();
}

class _AddProductTagScreenState extends State<AddProductTagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: DrawerDashboard(),
      body: SafeArea(
        child: Row(
          children: [
            const DrawerDashboard(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double width = constraints.maxWidth;
                      if (width > 1024) {
                        return SizedBox(height: 60, child: AppbarDashboard());
                      } else {
                        return AppbarDashboard();
                      }
                    },
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text('Dashboard/ ',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text('Ecommerce / Products Tags / New Tags',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 1024) {
                          // --- Mode desktop ---
                          return SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AddProductTagWidget(),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      ValidationWidget(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // --- Mode mobile/tablette ---
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddProductCategScreen(),
                                ValidationWidget(),
                              ],
                            ),
                          );
                        }
                      },
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

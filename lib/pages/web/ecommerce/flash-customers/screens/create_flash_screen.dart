import 'package:e_com_app/pages/web/ecommerce/brands-reviews/widgets/create_brand_widget.dart';
import 'package:e_com_app/pages/web/ecommerce/flash-customers/widgets/create_flash_widget.dart';
import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/drawer_widget.dart';
import '../../../product/screen/add_product_info_screen.dart';
import '../../products/widgets/categorie_check_widget.dart';

import '../../products/widgets/validation_widget.dart';

class CreateFlashScreen extends StatefulWidget {
  const CreateFlashScreen({super.key});

  @override
  State<CreateFlashScreen> createState() => _CreateFlashScreenState();
}

class _CreateFlashScreenState extends State<CreateFlashScreen> {
  final List<String> statuses = ['Published', 'Draft', 'Archived'];
  String _selectedStatus = 'Published';
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
                        Text('Ecommerce / Flash Sales / Create',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 1024) {
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
                                      CreateFlashWidget(),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      ValidationWidget(),
                                      SizedBox(height: 12),
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withValues(alpha: 0.2),
                                              spreadRadius: 10,
                                              blurRadius: 10,
                                              offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Status",
                                              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
                                            ),
                                            CustomDropdownField(
                                              value: _selectedStatus,
                                              items: statuses,
                                              onChanged: (val) {
                                                if (val != null) {
                                                  setState(() {
                                                    _selectedStatus = val;
                                                  });
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CreateFlashWidget(),
                                SizedBox(height: 12),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withValues(alpha: 0.2),
                                        spreadRadius: 10,
                                        blurRadius: 10,
                                        offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      CustomDropdownField(
                                        value: _selectedStatus,
                                        items: statuses,
                                        onChanged: (val) {
                                          if (val != null) {
                                            setState(() {
                                              _selectedStatus = val;
                                            });
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
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

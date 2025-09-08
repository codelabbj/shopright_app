import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../ecommerce/products/widgets/validation_widget.dart';
import '../widets/create_product_table_widget.dart';

class CreateProductTableScreen extends StatefulWidget {
  const CreateProductTableScreen({super.key});

  @override
  State<CreateProductTableScreen> createState() => _CreateProductTableScreenState();
}

class _CreateProductTableScreenState extends State<CreateProductTableScreen> {
  final List<String> statuses = ['Published', 'Draft', 'Archived'];
  String _selectedStatus = 'Published';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const DrawerDashboard(),
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
                        return const SizedBox(height: 60, child: AppbarDashboard());
                      } else {
                        return const AppbarDashboard();
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text('Dashboard/ ',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text('Specification Tables / Create',
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
                                const Expanded(
                                  flex: 3,
                                  child: CreateProductTableWidget(),
                                ),
                                const SizedBox(width: 16),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      const ValidationWidget(),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withValues(alpha: 0.2),
                                              spreadRadius: 10,
                                              blurRadius: 10,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Status',
                                                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                                            CustomDropdownField(
                                              value: _selectedStatus,
                                              items: statuses,
                                              onChanged: (val) {
                                                if (val != null) {
                                                  setState(() => _selectedStatus = val);
                                                }
                                              },
                                            ),
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
                                const CreateProductTableWidget(),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withValues(alpha: 0.2),
                                        spreadRadius: 10,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Status',
                                          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                                      CustomDropdownField(
                                        value: _selectedStatus,
                                        items: statuses,
                                        onChanged: (val) {
                                          if (val != null) {
                                            setState(() => _selectedStatus = val);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const ValidationWidget(),
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



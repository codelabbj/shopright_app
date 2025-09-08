import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../ecommerce/products/widgets/validation_widget.dart';
import '../widgets/create_contact_custom_field_widget.dart';

class CreateContactCustomFieldScreen extends StatelessWidget {
  const CreateContactCustomFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> statuses = ['Published', 'Draft', 'Archived'];
    String selected = 'Published';
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
                  const SizedBox(height: 60, child: AppbarDashboard()),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text('Dashboard/ ',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text('Contacts / Custom Fields / Create',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(flex: 3, child: CreateContactCustomFieldWidget()),
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
                                  child: StatefulBuilder(builder: (context, setSB) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Status',
                                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                                        CustomDropdownField(
                                          value: selected,
                                          items: statuses,
                                          onChanged: (val) => setSB(() => selected = val ?? selected),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
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



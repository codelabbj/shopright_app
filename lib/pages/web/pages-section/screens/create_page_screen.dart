import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../ecommerce/products/widgets/validation_widget.dart';
import '../widgets/create_page_widget.dart';

class CreatePageScreen extends StatefulWidget {
  const CreatePageScreen({super.key});

  @override
  State<CreatePageScreen> createState() => _CreatePageScreenState();
}

class _CreatePageScreenState extends State<CreatePageScreen> {
  final List<String> statuses = ['Published', 'Draft', 'Archived'];
  String _selectedStatus = 'Published';
  final List<String> templates = ['Default', 'Full width', 'Landing'];
  String _selectedTemplate = 'Default';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Row(children: [
          const DrawerDashboard(),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 60, child: AppbarDashboard()),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(children: [
                  Text('Dashboard/ ',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                  Text('Pages / Create New Page',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Expanded(flex: 3, child: CreatePageWidget()),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: Column(children: [
                        const ValidationWidget(),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: Theme.of(context).brightness == Brightness.light
                                ? [
                                    BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.2),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Status', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                            CustomDropdownField(
                              value: _selectedStatus,
                              items: statuses,
                              onChanged: (val) => setState(() => _selectedStatus = val ?? _selectedStatus),
                            ),
                            const SizedBox(height: 12),
                            Text('Template', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                            CustomDropdownField(
                              value: _selectedTemplate,
                              items: templates,
                              onChanged: (val) => setState(() => _selectedTemplate = val ?? _selectedTemplate),
                            ),
                            const SizedBox(height: 12),
                            Text('Image', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                            Container(
                              height: 110,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Theme.of(context).dividerColor),
                              ),
                              child: const Icon(Icons.image_outlined),
                            ),
                            const SizedBox(height: 12),
                            Text('Breadcrumb background', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                            Container(
                              height: 110,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Theme.of(context).dividerColor),
                              ),
                              child: const Icon(Icons.image_outlined),
                            ),
                          ]),
                        ),
                      ]),
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



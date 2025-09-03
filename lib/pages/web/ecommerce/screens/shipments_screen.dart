import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/customs_text_form_field.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../pages-section/widgets/filter_widget.dart';
import '../widgets/shipments_widget.dart';

class ShipmentsScreen extends StatefulWidget {
  const ShipmentsScreen({super.key});

  @override
  State<ShipmentsScreen> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<ShipmentsScreen> {
  bool isFilterVisible = false;
  final TextEditingController newFilter = TextEditingController();
  String selectedStatus = "Status";
  String selectedCondition = "Less than";
  String selectedValue = "Draft";
  List<Widget> additionalFilters = [];

  int filterCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 60, child: AppbarDashboard()),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text('Dashboard/ ',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text('Ecommerce / Shipments', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Visibility(
                            visible: isFilterVisible,
                            child: FilterPanelWidget(
                              selectedStatus: selectedStatus,
                              selectedCondition: selectedCondition,
                              selectedValue: selectedValue,
                              onStatusChanged: (val) => setState(() => selectedStatus = val ?? "Status"),
                              onConditionChanged: (val) => setState(() => selectedCondition = val ?? "Less than"),
                              onValueChanged: (val) => setState(() => selectedValue = val ?? "Draft"),
                              onApply: () {},
                              onClose: () => setState(() => isFilterVisible = false),
                              additionalFilters: additionalFilters,
                              onAddFilter: () {
                                setState(() {
                                  final localIndex = filterCounter++;
                                  additionalFilters.add(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextFormField(
                                              label: "Filter $localIndex",
                                              hintText: 'Value',
                                              controller: newFilter,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                additionalFilters.removeWhere((element) => element.key == Key("filter_$localIndex"));
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration:
                                                  BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/supprimer.png",
                                                    width: 18,
                                                    height: 18,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // IconButton(
                                          //   icon: const Icon(Icons.delete, color: Colors.red),
                                          //   onPressed: () {
                                          //
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 900,
                            child: CardListWidget(
                              buttons: const [CustomSearchWidget()],
                              actions: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/reload.png",
                                        width: 18,
                                        height: 18,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Reload",
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                                  child: const ShipmentsWidget(),
                                ),
                              ),
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

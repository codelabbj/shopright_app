import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../../widgets/card_list_widget.dart';
import '../../../../widgets/custom_search_widget.dart';
import '../../../../widgets/drawer_widget.dart';
import '../../pages-section/widgets/filter_widget.dart';
import '../widgets/market_stores_widget.dart';
import '../widgets/market_vendors_widget.dart';
import '../widgets/market_withdrawal_widget.dart';

class MarketVendorsScreen extends StatefulWidget {
  const MarketVendorsScreen({super.key});

  @override
  State<MarketVendorsScreen> createState() => _MarketVendorsScreenState();
}

class _MarketVendorsScreenState extends State<MarketVendorsScreen> {
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
            DrawerDashboard(),
            Expanded(
              child: Column(
                children: [
                  // LayoutBuilder(
                  //   builder: (context, constraints) {
                  //     double width = constraints.maxWidth;
                  //     if (width > 1024) {
                  //       // return SizedBox(height: 60, child: AppBarWidget());
                  //     } else {
                  //       // return AppBarVendorWidget();
                  //     }
                  //   },
                  // ),
                  SizedBox(height: 60, child: AppbarDashboard()),

                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text("Dashboard/Marketplace",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text("/Vendors", style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
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
                          SizedBox(
                            height: 900,
                            child: CardListWidget(
                              buttons: [
                                CustomSearchWidget(),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFilterVisible = !isFilterVisible; // toggle l'affichage
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey[200]!,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/filtre.png",
                                          width: 18,
                                          height: 18,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Filter",
                                          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                                SizedBox(
                                  width: 10,
                                ),

                                SizedBox(
                                  width: 10,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     formList = "list-ui";
                                //     context.go('/products');
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.all(5),
                                //     decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
                                //     child: Icon(Icons.picture_in_picture_alt_outlined, size: 18, color: Colors.black),
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                // InkWell(
                                //   onTap: () {
                                //     formList = "grid-product";
                                //     context.go('/grid-product');
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.all(5),
                                //     decoration: BoxDecoration(
                                //         border: Border.all(color: formList == "grid-product" ? Theme.of(context).colorScheme.primary : Colors.grey[200]!),
                                //         borderRadius: BorderRadius.circular(5)),
                                //     child: Row(
                                //       children: [
                                //         Icon(Icons.grid_view, size: 18, color: Colors.grey),
                                //         Icon(
                                //           Icons.table_rows_outlined,
                                //           size: 18,
                                //           color: Colors.grey,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width,
                                  ),
                                  child: MarketVendorsWidget(),
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

import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/app_bar_widget.dart';
import '../../../../../widgets/card_list_widget.dart';
import '../../../../../widgets/customs_text_form_field.dart';
import '../../../../../widgets/drawer_widget.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final TextEditingController noteController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  String paymentMethod = 'Cash on delivery (COD)';
  String paymentStatus = 'Pending';

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
                        Text('Ecommerce / Orders / Create', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Order information
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Order Information",
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(child: Divider()),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // CustomTextFormField(
                                      //   label: 'Search or create a new product',
                                      //   hintText: 'Search products... ', controller: ,
                                      // ),
                                      // const SizedBox(height: 16),
                                      Text('Note', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 8),
                                      CustomTextFormField(
                                        label: 'Note for order... ',
                                        isMultiline: true,
                                        controller: noteController,
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                _amountRow('Sub amount', '\$0.00', context),
                                                _amountRow('Tax Amount', '\$0.00', context),
                                                _amountRow('Promotion amount', '\$0.00', context),
                                                _amountRow('Discount', '\$0.00', context),
                                                const Divider(),
                                                _amountRow('Total amount', '\$0.00', context, isBold: true),
                                                const SizedBox(height: 24),
                                                Text('Payment Method',
                                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 6),
                                                CustomDropdownField(
                                                  value: paymentMethod,
                                                  items: ["Cash on delivery (COD)", "Bank transfer", "Card"],
                                                  onChanged: (v) => setState(() => paymentMethod = v ?? paymentMethod),
                                                ),
                                                const SizedBox(height: 16),
                                                Text('Payment status',
                                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 6),
                                                CustomDropdownField(
                                                  value: paymentStatus,
                                                  items: ["Pending", "Completed", "Failed"],
                                                  onChanged: (v) => setState(() => paymentStatus = v ?? paymentStatus),
                                                ),
                                                const SizedBox(height: 24),
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: FilledButton(
                                                    onPressed: () {},
                                                    child: const Text('Create order'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Right: Customer information
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 10, bottom: 15),
                            height: 150,
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Customer Information",
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(child: Divider()),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CustomTextFormField(hintText: "Search Customer", controller: customerController)),
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
          ],
        ),
      ),
    );
  }

  Widget _amountRow(String label, String value, BuildContext context, {bool isBold = false}) {
    final textStyle = isBold
        ? Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Text(value, style: textStyle),
        ],
      ),
    );
  }
}

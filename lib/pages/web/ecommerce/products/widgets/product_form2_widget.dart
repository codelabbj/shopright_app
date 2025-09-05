import 'package:flutter/material.dart';

import '../../../../../widgets/customs_text_form_field.dart';

class ProductForm2Widget extends StatefulWidget {
  const ProductForm2Widget({super.key});

  @override
  State<ProductForm2Widget> createState() => _ProductForm2WidgetState();
}

class _ProductForm2WidgetState extends State<ProductForm2Widget> {
  final TextEditingController skuController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  bool storehouseManagement = false;
  String stockStatus = 'in_stock'; // Options: in_stock, out_of_stock, backorder

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Overview", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: "SKU",
            hintText: "Enter SKU",
            controller: skuController,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  label: "Price",
                  hintText: "Enter product price",
                  controller: priceController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  label: "Sales Price",
                  hintText: "Enter sale price",
                  controller: salePriceController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            label: "Item cost",
            hintText: "Enter item cost",
            controller: costController,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            label: "Barcode (ISBN, UPC, GTIN, etc.)",
            hintText: "Barcode (ISBN, UPC, GTIN, etc.)",
            controller: barcodeController,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: storehouseManagement,
                onChanged: (value) {
                  setState(() {
                    storehouseManagement = value!;
                  });
                },
              ),
              Text(
                "With storehouse management",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text("Stock status:", style: TextStyle(fontWeight: FontWeight.bold)),
          // Row(
          //   children: [
          //     RadioListTile(
          //       title: const Text('In stock'),
          //       value: 'in_stock',
          //       groupValue: stockStatus,
          //       onChanged: (value) {
          //         setState(() {
          //           stockStatus = value!;
          //         });
          //       },
          //     ),
          //     RadioListTile(
          //       title: const Text('Out of stock'),
          //       value: 'out_of_stock',
          //       groupValue: stockStatus,
          //       onChanged: (value) {
          //         setState(() {
          //           stockStatus = value!;
          //         });
          //       },
          //     ),
          //     RadioListTile(
          //       title: const Text('On backorder'),
          //       value: 'backorder',
          //       groupValue: stockStatus,
          //       onChanged: (value) {
          //         setState(() {
          //           stockStatus = value!;
          //         });
          //       },
          //     ),
          //   ],
          // ),
          const Divider(height: 32),
          Text("Shipping", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  label: "Weigth (g)",
                  hintText: "Enter product weigth",
                  controller: weightController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  label: "Length (cm)",
                  hintText: "Enter product size",
                  controller: lengthController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  label: "Width (cm)",
                  hintText: "Enter product width",
                  controller: weightController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  label: "Heigth (cm)",
                  hintText: "Enter product width",
                  controller: weightController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

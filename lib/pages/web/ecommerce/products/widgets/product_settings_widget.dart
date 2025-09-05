import 'package:flutter/material.dart';

class ProductSettingsWidget extends StatefulWidget {
  const ProductSettingsWidget({Key? key}) : super(key: key);

  @override
  State<ProductSettingsWidget> createState() => _ProductSettingsWidgetState();
}

class _ProductSettingsWidgetState extends State<ProductSettingsWidget> {
  // Labels
  bool isHot = false;
  bool isNew = false;
  bool isSale = false;

  // Taxes
  bool taxNone = false;
  bool taxVAT = false;
  bool taxImport = false;

  // Minimum quantity
  final TextEditingController minOrderController = TextEditingController(text: '0');

  Widget buildSection({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
          Text(title, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget buildCheckbox(String label, bool value, void Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      child: Column(
        children: [
          buildSection(
            title: 'Labels',
            child: Column(
              children: [
                buildCheckbox("Hot", isHot, (val) => setState(() => isHot = val!)),
                buildCheckbox("New", isNew, (val) => setState(() => isNew = val!)),
                buildCheckbox("Sale", isSale, (val) => setState(() => isSale = val!)),
              ],
            ),
          ),
          buildSection(
            title: 'Taxes',
            child: Column(
              children: [
                buildCheckbox("None (0%)", taxNone, (val) => setState(() => taxNone = val!)),
                buildCheckbox("VAT (10%)", taxVAT, (val) => setState(() => taxVAT = val!)),
                buildCheckbox("Import Tax (15%)", taxImport, (val) => setState(() => taxImport = val!)),
              ],
            ),
          ),
          buildSection(
            title: 'Minimum order quantity',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: minOrderController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Minimum quantity to place an order, if the value is 0, there is no limit.',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

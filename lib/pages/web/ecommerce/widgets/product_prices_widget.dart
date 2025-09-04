import 'package:flutter/material.dart';
import '../../../../models/product_price_model.dart';
import '../../../../widgets/customs_text_form_field.dart';

class ProductPricesWidget extends StatelessWidget {
  const ProductPricesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductPriceModel> items = const [
      ProductPriceModel(
          id: 34,
          title: 'Acer Predator X38...',
          sku: 'JS-108',
          imageAsset: '',
          price: '630',
          salePrice: '379'),
      ProductPriceModel(
          id: 22,
          title: 'Alienware m15 R6...',
          sku: 'CP-106-A1',
          imageAsset: ''),
      ProductPriceModel(
          id: 11,
          title: 'Amazon Echo Show 10',
          sku: 'QL-168-A1',
          imageAsset: ''),
    ];

    return DataTable(
      columnSpacing: 12,
      // dataRowMinHeight: 60,
      dataRowMaxHeight: 65,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: [
        // DataColumn(label: Text('')),
        DataColumn(
            label: Text(
          'ID',
          style: Theme.of(context).textTheme.labelSmall,
        )),
        DataColumn(
            label: Text(
          'Image',
          style: Theme.of(context).textTheme.labelSmall,
        )),
        DataColumn(
            label: Expanded(
                child: Text(
          'Products',
          style: Theme.of(context).textTheme.labelSmall,
        ))),
        DataColumn(
            label: Text(
          'Cost per item',
          style: Theme.of(context).textTheme.labelSmall,
        )),
        DataColumn(
            label: Text(
          'Price',
          style: Theme.of(context).textTheme.labelSmall,
        )),
        DataColumn(
            label: Text(
          'Price sale',
          style: Theme.of(context).textTheme.labelSmall,
        )),
      ],
      rows: items
          .map((e) => DataRow(cells: [
                // const DataCell(SizedBox()),
                DataCell(Text(e.id.toString(),
                    style: Theme.of(context).textTheme.labelSmall)),
                const DataCell(FlutterLogo(size: 30)),
                DataCell(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title,
                          style: Theme.of(context).textTheme.labelSmall!),
                      Text('SKU: ${e.sku}',
                          style: Theme.of(context).textTheme.labelSmall!),
                    ])),
                DataCell(Container(
                    // margin: EdgeInsets.only(top: 7),
                    width: 100,
                    alignment: Alignment.topCenter,
                    child: CustomTextFormField(
                        controller:
                            TextEditingController(text: e.costPerItem)))),
                DataCell(Container(
                    // height: 13,
                    width: 100,
                    alignment: Alignment.topCenter,
                    child: CustomTextFormField(
                        controller: TextEditingController(text: e.price)))),
                DataCell(Container(
                    width: 100,
                    alignment: Alignment.centerLeft,
                    child: CustomTextFormField(
                        controller: TextEditingController(text: e.salePrice)))),
                // _buildActionButtons(context)
              ]))
          .toList(),
    );
  }

  static DataCell _buildActionButtons(context) {
    return DataCell(
      Row(
        children: [
          IconButton(
            icon: Row(
              children: [
                Image.asset(
                  "assets/images/editer.png",
                  width: 15,
                  height: 15,
                ),
                SizedBox(width: 5),
                Text("Edit", style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Row(
              children: [
                Image.asset(
                  "assets/images/supprimer.png",
                  width: 15,
                  height: 15,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text(
                  "Delete",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
            onPressed: () {
              // Action delete
            },
          ),
        ],
      ),
    );
  }
}

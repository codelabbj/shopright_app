import 'package:e_com_app/utils/utils.dart' show Utils;
import 'package:flutter/material.dart';

import '../../../../models/order_model.dart';
import '../../../../models/tracking_step_widget.dart';

import 'order_detail_widget.dart';

class OrdersTabWidget extends StatelessWidget {
  const OrdersTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sampleOrder = OrderModel(
      id: '#SLR132128-6N',
      formattedDate: '13 February, 2025 at 10:45 AM',
      status: 'Paid',
      productName: 'Apple iMac 2023',
      productCategory: 'Laptop & PC',
      productColor: 'Blue',
      productStorage: '512 GB',
      originalPrice: '1,315',
      currentPrice: '1,299',
      discount: '-2',
      subtotal: '1,299',
      shipping: '38',
      taxes: '80',
      total: '1,417',
      trackingSteps: [
        TrackingStepModel(
          title: 'Package Confirmed',
          date: 'Nov 16, 2024',
          location: 'Oakwood Drive, Dallas, TX',
          isCompleted: true,
        ),
        TrackingStepModel(
          title: 'In Transit With Carrier',
          date: 'Nov 17, 2024',
          location: 'Maple Lane, Waco, TX',
          isCompleted: true,
        ),
        TrackingStepModel(
          title: 'Arrived At Local Depot',
          date: 'Nov 18, 2024',
          location: 'Banyan Street, Austin, TX',
          isCompleted: true,
        ),
        TrackingStepModel(
          title: 'In Delivery To Destination',
          date: 'Nov 18, 2024',
          location: 'Elm Avenue, Austin, TX',
          status: 'Expected delivery today',
          isCompleted: false,
        ),
      ],
    );
    return Container(
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[300]),
        headingRowHeight: 40,
        columns: [
          DataColumn(
            label: Expanded(
              child: Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  side: BorderSide(color: Colors.grey[500]!),
                  value: false,
                  onChanged: (bool? value) {
                    // Your code here, e.g.
                    print('Checkbox changed to $value');
                  },
                ),
              ),
            ),
          ),
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Expanded(child: Text('Product Name'))),
          DataColumn(label: Text('Order Date')),
          DataColumn(label: Text('Performance')),
          DataColumn(label: Expanded(child: Text('Customer Name'))),
          DataColumn(label: Expanded(child: Text('Payment'))),
          DataColumn(label: Expanded(child: Text('Payment Status'))),
          DataColumn(label: Expanded(child: Text('Total Price'))),
          DataColumn(label: Expanded(child: Text('Quantity'))),
          DataColumn(label: Expanded(child: Text('Order Status'))),
          DataColumn(label: Text('Action')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                side: BorderSide(color: Colors.grey[500]!),
                value: true,
                onChanged: (bool? value) {
                  print('Checkbox changed to $value');
                },
              ),
            )),
            DataCell(
                Text('ORD001', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('iPhone 13 Pro',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('2025-08-01',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Excellent',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('John Doe',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('MTN Mobile Money',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildOrderStatus('Paid', context)),
            DataCell(
                Text('\$1299', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('1', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildStockStatus('Delivered', context)),
            _buildActionButtons(context, sampleOrder)
          ]),
          DataRow(cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                side: BorderSide(color: Colors.grey[500]!),
                value: false,
                onChanged: (bool? value) {
                  print('Checkbox changed to $value');
                },
              ),
            )),
            DataCell(
                Text('ORD002', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Samsung Galaxy A54',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('2025-08-03',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(
                Text('Good', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Jane Smith',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Orange Money',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildOrderStatus('Pending', context)),
            DataCell(
                Text('\$599', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('2', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildStockStatus('Processing', context)),
            _buildActionButtons(context, sampleOrder)
          ]),
          DataRow(cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                side: BorderSide(color: Colors.grey[500]!),
                value: true,
                onChanged: (bool? value) {
                  print('Checkbox changed to $value');
                },
              ),
            )),
            DataCell(
                Text('ORD003', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('MacBook Pro M2',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('2025-08-05',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Excellent',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Samuel Johnson',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Bank Transfer',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildOrderStatus('Paid', context)),
            DataCell(
                Text('\$2499', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('1', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildStockStatus('Shipped', context)),
            _buildActionButtons(context, sampleOrder)
          ]),
          DataRow(cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                side: BorderSide(color: Colors.grey[500]!),
                value: false,
                onChanged: (bool? value) {
                  print('Checkbox changed to $value');
                },
              ),
            )),
            DataCell(
                Text('ORD004', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Redmi Note 12',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('2025-08-06',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(
                Text('Average', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Amina Bello',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('Cash on Delivery',
                style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildOrderStatus('Unpaid', context)),
            DataCell(
                Text('\$299', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text('3', style: Theme.of(context).textTheme.labelSmall)),
            DataCell(_buildStockStatus('Cancelled', context)),
            _buildActionButtons(context, sampleOrder)
          ]),
        ],
      ),
    );
  }

  // Widget helper pour le statut
  Widget _buildStockStatus(String status, BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'delivered':
        bgColor = Colors.green[100]!;
        textColor = Colors.green[800]!;
        break;
      case 'processing':
        bgColor = Colors.orange[100]!;
        textColor = Colors.orange[800]!;
        break;
      case 'shipped':
        bgColor = Colors.blue[100]!;
        textColor = Colors.blue[800]!;
        break;
      case 'cancelled':
        bgColor = Colors.red[100]!;
        textColor = Colors.red[800]!;
        break;
      default:
        bgColor = Colors.grey[300]!;
        textColor = Colors.black87;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildOrderStatus(String Orderstatus, BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (Orderstatus.toLowerCase()) {
      case 'paid':
        bgColor = Colors.green[100]!;
        textColor = Colors.green[800]!;
        break;
      case 'pending':
        bgColor = Colors.orange[100]!;
        textColor = Colors.orange[800]!;
        break;
      case 'unpaid':
        bgColor = Colors.red[100]!;
        textColor = Colors.red[800]!;
        break;
      default:
        bgColor = Colors.grey[300]!;
        textColor = Colors.black87;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        Orderstatus,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  // Widget helper pour les boutons d’action
  static DataCell _buildActionButtons(context, OrderModel order) {
    return DataCell(
      Row(
        children: [
          IconButton(
            icon: Image.asset(
              "assets/images/pointeur-de-localisation.png",
              width: 15,
              height: 15,
            ),
            onPressed: () => Utils.showOrderDetails(context, order),
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/plus.png",
              width: 15,
              height: 15,
              color: Colors.black,
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

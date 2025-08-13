import 'package:e_com_app/pages/web/orders/widgets/order_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/order_model.dart';

class Utils {
  static void showOrderDetails(BuildContext context, OrderModel order) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: OrderTrackingWidget(order: order),
        ),
      ),
    );
  }
}

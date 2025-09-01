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

  static void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // empêche de fermer en cliquant dehors
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          titlePadding: const EdgeInsets.only(top: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          actionsPadding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          title: Column(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: 48,
              ),
              SizedBox(height: 8),
              Text(
                "Confirm delete",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          content: Text(
            "Do you really want to delete this record?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // confirme suppression
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Delete",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false); // annule
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

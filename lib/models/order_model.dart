import 'package:e_com_app/models/tracking_step_widget.dart'
    show TrackingStepModel;

class OrderModel {
  final String id;
  final String formattedDate;
  final String status;
  final String productName;
  final String productCategory;
  final String productColor;
  final String productStorage;
  final String? originalPrice;
  final String currentPrice;
  final String? discount;
  final String subtotal;
  final String shipping;
  final String taxes;
  final String total;
  final List<TrackingStepModel> trackingSteps;

  OrderModel({
    required this.id,
    required this.formattedDate,
    required this.status,
    required this.productName,
    required this.productCategory,
    required this.productColor,
    required this.productStorage,
    this.originalPrice,
    required this.currentPrice,
    this.discount,
    required this.subtotal,
    required this.shipping,
    required this.taxes,
    required this.total,
    required this.trackingSteps,
  });
}

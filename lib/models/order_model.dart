import 'package:e_com_app/models/tracking_step_widget.dart';

class OrderModel {
  final String? id;
  final String? formattedDate;
  final String status;
  final String? productName;
  final String? productCategory;
  final String? productColor;
  final String? productStorage;
  final String? originalPrice;
  final String? currentPrice;
  final String? discount;
  final String? subtotal;
  final String? shipping;
  final String? taxes;
  final String total;
  final List<TrackingStepModel>? trackingSteps;
  final String? reference;
  final String? date;
  final String? customer;

  OrderModel({
    this.id,
    this.formattedDate,
    required this.status,
    this.productName,
    this.productCategory,
    this.productColor,
    this.productStorage,
    this.originalPrice,
    this.currentPrice,
    this.discount,
    this.subtotal,
    this.shipping,
    this.taxes,
    required this.total,
    this.trackingSteps,
    this.reference,
    this.date,
    this.customer,
  });
}

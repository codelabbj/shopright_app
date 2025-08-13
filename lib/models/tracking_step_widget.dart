class TrackingStepModel {
  final String title;
  final String date;
  final String? location;
  final String? status;
  final bool isCompleted;

  TrackingStepModel({
    required this.title,
    required this.date,
    this.location,
    this.status,
    required this.isCompleted,
  });
}

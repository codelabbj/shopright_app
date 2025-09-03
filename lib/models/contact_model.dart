class ContactModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String createdAt;
  final String status; // Read / Unread

  const ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.status,
  });
}



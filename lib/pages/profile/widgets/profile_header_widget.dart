import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarUrl;
  final VoidCallback? onEditTap;

  const ProfileHeaderWidget({
    Key? key,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.onEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.5),
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: avatarUrl == null
                ? const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black54,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEditTap,
            icon: const Icon(
              Icons.edit,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

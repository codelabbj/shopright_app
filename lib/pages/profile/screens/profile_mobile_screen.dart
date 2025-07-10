import 'package:e_com_app/pages/profile/widgets/profile_header_widget.dart';
import 'package:e_com_app/pages/profile/widgets/profile_section_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_section_holder_widget.dart';

class ProfileMobileScreen extends StatefulWidget {
  const ProfileMobileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMobileScreen> createState() => _ProfileMobileScreenState();
}

class _ProfileMobileScreenState extends State<ProfileMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Barre d'en-tête
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Contenu scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // En-tête du profil
                    ProfileHeaderWidget(
                      name: 'Your profile',
                      email: 'example@gmail.com',
                      onEditTap: () {
                        // Action d'édition
                        print('Edit profile tapped');
                      },
                    ),

                    // Section Account
                    ProfileSectionHolderWidget(
                      title: 'Account',
                      children: [
                        ProfileSectionWidget(
                          icon: Icons.person_outline,
                          title: 'My data',
                          onTap: () => print('My data tapped'),
                        ),
                        ProfileSectionWidget(
                          icon: Icons.location_on_outlined,
                          title: 'Location',
                          onTap: () => print('Location tapped'),
                        ),
                        ProfileSectionWidget(
                          icon: Icons.favorite_outline,
                          title: 'My favorite',
                          onTap: () => print('My favorite tapped'),
                        ),
                        ProfileSectionWidget(
                          icon: Icons.notifications_outlined,
                          title: 'Notification',
                          onTap: () => print('Notification tapped'),
                        ),
                      ],
                    ),

                    // Section Security
                    ProfileSectionHolderWidget(
                      title: 'Security',
                      children: [
                        ProfileSectionWidget(
                          icon: Icons.security_outlined,
                          title: 'Access options',
                          onTap: () => print('Access options tapped'),
                        ),
                      ],
                    ),

                    // Section Support
                    ProfileSectionHolderWidget(
                      title: 'Support',
                      children: [
                        ProfileSectionWidget(
                          icon: Icons.help_outline,
                          title: 'Help center',
                          onTap: () => print('Help center tapped'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

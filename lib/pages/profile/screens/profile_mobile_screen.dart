import 'package:e_com_app/pages/profile/widgets/profile_header_widget.dart';
import 'package:e_com_app/pages/profile/widgets/profile_section_widget.dart';
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
    bool isDark = false;

    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 100,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: const Text(
      //       'Profile',
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.w700,
      //         color: Colors.black87,
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Barre d'en-tête

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
                        ProfileSectionWidget(
                          iconWidget: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return RotationTransition(
                                  turns: animation, child: child);
                            },
                            child: Icon(
                              isDark ? Icons.dark_mode : Icons.light_mode,
                              key: ValueKey(isDark),
                              color: isDark ? Colors.amber : Colors.blueGrey,
                            ),
                          ),
                          showTrailing: false,
                          title: 'Changer le thème',
                          onTap: () {
                            setState(() {
                              isDark = !isDark;
                            });
                          },
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

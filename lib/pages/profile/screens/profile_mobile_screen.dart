import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:e_com_app/pages/card/screens/chart_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/theme/theme_cubit.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_section_widget.dart';
import '../widgets/profile_section_holder_widget.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeaderWidget(
                      name: 'Your profile',
                      email: 'example@gmail.com',
                      onEditTap: () => print('Edit profile tapped'),
                    ),
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
                            transitionBuilder: (child, animation) => RotationTransition(turns: animation, child: child),
                            child: Icon(
                              isDark ? Icons.dark_mode : Icons.light_mode,
                              key: ValueKey(isDark),
                              color: isDark ? Colors.amber : Colors.blueGrey,
                            ),
                          ),
                          showTrailing: false,
                          title: 'Changer le thème',
                          onTap: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              AdaptiveTheme.of(context).toggleThemeMode();
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (_) => ChartMobileScreen()),
                            // );
                          },
                        ),
                      ],
                    ),
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

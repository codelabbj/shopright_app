import 'package:e_com_app/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

import '../constantes/const.dart';

class AppbarDashboard extends StatelessWidget {
  const AppbarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColors.PRIMARY_BLACK3_COLOR, // fond général
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (screenWidth > 1150)
            Container(
              width: Const.screenWidth(context) * 0.23,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: Theme.of(context).textTheme.labelSmall,
                      decoration: InputDecoration(
                        hintText: 'Search anything...',
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Icon(
              Icons.search,
              color: isLight ? Colors.grey[300] : Colors.black,
            ),
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     double width = constraints.maxWidth;
          //     if (width > 1150) {
          //       return Container(
          //         width: Const.screenWidth(context) * 0.23,
          //         child: Row(
          //           children: [
          //             // Icon(Icons.search, size: 20, color: Colors.grey),
          //             SizedBox(width: 10),
          //             Expanded(
          //               child: TextField(
          //                 style: Theme.of(context).textTheme.labelSmall,
          //                 decoration: InputDecoration(
          //                   hintText: 'Search anything...',
          //                   hintStyle: Theme.of(context).textTheme.labelSmall,
          //                   border: InputBorder.none,
          //                   isDense: true,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     } else {
          //       return Icon(
          //         Icons.search,
          //         color: isLight ? Colors.grey[300] : Colors.black,
          //       );
          //     }
          //   },
          // ),

          const SizedBox(width: 20),

          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              // color: Colors.black,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/globe.png",
                  width: 22,
                  height: 22,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'View website',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),
          InkWell(
            onTap: () => context.read<ThemeCubit>().toggleTheme(),
            child: _themeIcon(context),
          ),

          const SizedBox(width: 3),
          // 🔔 Notification
          _iconCircle("assets/images/notification.png"),

          const SizedBox(width: 3),

          // 💬 Message
          _iconCircle("assets/images/messenger1.png"),

          const SizedBox(width: 3),
          _iconCircle("assets/images/panier.png"),
          CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 18,
              child: Image.asset(
                "assets/images/user.png",
                width: 20,
                height: 20,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  // Widget réutilisable pour les cercles d'icônes
  Widget _iconCircle(String imageUrl) {
    return Container(
      height: 36,
      width: 36,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // color: Colors.white,
      ),
      padding: const EdgeInsets.all(8), // espace autour de l'image
      child: Image.asset(
        imageUrl,
        width: 25,
        height: 25,
        color: Colors.white,
        fit: BoxFit.contain, // ajuste l'image à la taille disponible
      ),
    );
  }

  Widget _themeIcon(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return _iconCircle(isDark ? "assets/images/night-mode (1).png" : "assets/images/day-mode.png");
  }
}

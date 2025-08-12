import 'package:flutter/material.dart';

import '../pages/mobile/acceuil/screens/acceuil_mobile_screen.dart';
import '../pages/mobile/card/screens/chart_mobile_screen.dart';
import '../pages/mobile/favoris/screens/wish_mobile_screen.dart';
import '../pages/mobile/profile/screens/profile_mobile_screen.dart';

class Const {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static List<Map<String, dynamic>> bottomList = [
    {'icon': "assets/images/home (1).png", 'active_icon': "assets/images/home (1).png", "screen": AcceuilMobileScreen(), "label": "Home"},
    {
      'icon': "assets/images/coeur.png",
      'active_icon': "assets/images/coeur.png",
      "screen": WishMobileScreen(), // crée ce screen si pas encore fait
      "label": "Wishlist"
    },
    {'icon': "assets/images/panier.png", 'active_icon': "assets/images/panier.png", "screen": ChartMobileScreen(), "label": "Chart"},
    {'icon': "assets/images/user (1).png", 'active_icon': "assets/images/user (1).png", "screen": ProfileMobileScreen(), "label": "Profile"},
  ];
}

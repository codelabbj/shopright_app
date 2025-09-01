import 'dart:developer';

import 'package:e_com_app/widgets/market_place_widget.dart';
import 'package:e_com_app/widgets/plugins_drawer_widget.dart';
import 'package:e_com_app/widgets/product_specification_widget.dart';
import 'package:e_com_app/widgets/tools_drawer_widget.dart';
import 'package:e_com_app/widgets/transaction_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../constantes/const.dart';
import '../../../cubits/switch_page/switch_page_cubit.dart';
import '../../../cubits/switch_page/switch_page_state.dart';
import '../theme/app_colors.dart';
import 'ads_drawer_widget.dart';
import 'appearence_widget.dart';
import 'blog_drawer_widget.dart';
import 'contact_drawer_widget.dart';
import 'ecom_drawer_widget.dart';
import 'faqs_drawer_widget.dart';
import 'locations_drawer_widget.dart';

class DrawerDashboard extends StatefulWidget {
  const DrawerDashboard({super.key});

  @override
  State<DrawerDashboard> createState() => _DrawerDashboardState();
}

class _DrawerDashboardState extends State<DrawerDashboard> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<CollaborateursCubit>().getCustomerDetails();
  //   _loadRoleId();
  // }
  //
  // Future<void> _loadRoleId() async {
  //   final id = await SharedPreferencesUtils.getInt('role_id');
  //   log("Voici le roleId: $id");
  //   setState(() {
  //     roleId = id;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchPageCubit, SwitchPageState>(
      builder: (context, state) => Container(
        width: Const.screenWidth(context) * 0.2,
        height: Const.screenHeight(context),
        color: AppColors.PRIMARY_BLACK3_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12),
                child: Row(
                  children: [
                    SizedBox(height: 10),
                    InkWell(
                      child: Image.asset(
                        "assets/images/drawer.png",
                        width: 32,
                        height: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Shofy.",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13),
              Divider(
                height: 5,
                thickness: 1,
                color: Colors.grey[700],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context),
                height: 35,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    // context.read<SwitchPageCubit>().state.selectedPage == 0
                    //     ? BoxShadow(
                    //         color: Colors.grey.withValues(alpha: 0.2),
                    //         spreadRadius: 10,
                    //         blurRadius: 10,
                    //         offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                    //       )
                    //     : BoxShadow(
                    //
                    //         // Décalage horizontal et vertical de l'ombre
                    //         )
                  ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 0 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(0);
                    context.go('/dashboard');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/dashboards.png",
                        color: context.read<SwitchPageCubit>().state.selectedPage == 0 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Dashboard',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 0 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              EcomDrawerWidget(),
              ProductSpecificationWidget(),
              MarketPlaceWidget(),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  // boxShadow: [
                  //   context.read<SwitchPageCubit>().state.selectedPage == 4
                  //       ? BoxShadow(
                  //           color: Colors.grey.withValues(alpha: 0.2),
                  //           spreadRadius: 10,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                  //         )
                  //       : BoxShadow(
                  //
                  //           // Décalage horizontal et vertical de l'ombre
                  //           )
                  // ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(4);
                    context.go('/pages');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/page.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Pages',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              BlogDrawerWidget(),
              TransactionDrawerWidget(),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  // boxShadow: [
                  //   context.read<SwitchPageCubit>().state.selectedPage == 4
                  //       ? BoxShadow(
                  //           color: Colors.grey.withValues(alpha: 0.2),
                  //           spreadRadius: 10,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                  //         )
                  //       : BoxShadow(
                  //
                  //           // Décalage horizontal et vertical de l'ombre
                  //           )
                  // ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 7 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(7);
                    context.go('/galeries');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/gallery.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 7 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Galeries',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 7 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  color: context.read<SwitchPageCubit>().state.selectedPage == 8 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(8);
                    context.go('/testimonials');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/testimonies.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 8 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Testimonies',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 8 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              AdsDrawerWidget(),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),

                  color: context.read<SwitchPageCubit>().state.selectedPage == 10 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(10);
                    context.go('/annoncements');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/marketing.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 10 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Annoncements',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 10 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              ContactDrawerWidget(),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  // boxShadow: [
                  //   context.read<SwitchPageCubit>().state.selectedPage == 4
                  //       ? BoxShadow(
                  //           color: Colors.grey.withValues(alpha: 0.2),
                  //           spreadRadius: 10,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                  //         )
                  //       : BoxShadow(
                  //
                  //           // Décalage horizontal et vertical de l'ombre
                  //           )
                  // ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(4);
                    context.go('/promote');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/gallery.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Simple Sliders',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              FaqsDrawerWidget(),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  // boxShadow: [
                  //   context.read<SwitchPageCubit>().state.selectedPage == 4
                  //       ? BoxShadow(
                  //           color: Colors.grey.withValues(alpha: 0.2),
                  //           spreadRadius: 10,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                  //         )
                  //       : BoxShadow(
                  //
                  //           // Décalage horizontal et vertical de l'ombre
                  //           )
                  // ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(4);
                    context.go('/promote');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/newsletter.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Newsletters',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              LocationsDrawerWidget(),
              // Container(
              //   // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   width: Const.screenWidth(context) * 0.19,
              //   height: 35,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(6),
              //     // boxShadow: [
              //     //   context.read<SwitchPageCubit>().state.selectedPage == 4
              //     //       ? BoxShadow(
              //     //           color: Colors.grey.withValues(alpha: 0.2),
              //     //           spreadRadius: 10,
              //     //           blurRadius: 10,
              //     //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
              //     //         )
              //     //       : BoxShadow(
              //     //
              //     //           // Décalage horizontal et vertical de l'ombre
              //     //           )
              //     // ],
              //     color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
              //   ),
              //   child: TextButton(
              //     onPressed: () {
              //       context.read<SwitchPageCubit>().switchPage(4);
              //       context.go('/promote');
              //     },
              //     style: ButtonStyle(
              //       overlayColor: MaterialStateProperty.resolveWith<Color?>(
              //         (Set<MaterialState> states) {
              //           if (states.contains(MaterialState.hovered)) {
              //             return Colors.transparent; // Pas d'effet au survol
              //           }
              //           return null; // Laisser les autres états par défaut
              //         },
              //       ),
              //     ),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           "assets/images/social-media.png",
              //           width: 20,
              //           height: 20,
              //           color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
              //         ),
              //         SizedBox(width: 5),
              //         Text(
              //           'Media',
              //           style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //                 color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
              //               ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              AppearenceWidget(),
              PluginsDrawerWidget(),
              ToolsDrawerWidget(),
              // Container(
              //   // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   width: Const.screenWidth(context) * 0.19,
              //   height: 35,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(6),
              //     // boxShadow: [
              //     //   context.read<SwitchPageCubit>().state.selectedPage == 4
              //     //       ? BoxShadow(
              //     //           color: Colors.grey.withValues(alpha: 0.2),
              //     //           spreadRadius: 10,
              //     //           blurRadius: 10,
              //     //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
              //     //         )
              //     //       : BoxShadow(
              //     //
              //     //           // Décalage horizontal et vertical de l'ombre
              //     //           )
              //     // ],
              //     color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
              //   ),
              //   child: TextButton(
              //     onPressed: () {
              //       context.read<SwitchPageCubit>().switchPage(4);
              //       context.go('/promote');
              //     },
              //     style: ButtonStyle(
              //       overlayColor: MaterialStateProperty.resolveWith<Color?>(
              //         (Set<MaterialState> states) {
              //           if (states.contains(MaterialState.hovered)) {
              //             return Colors.transparent; // Pas d'effet au survol
              //           }
              //           return null; // Laisser les autres états par défaut
              //         },
              //       ),
              //     ),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           "assets/images/settings.png",
              //           width: 20,
              //           height: 20,
              //           color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
              //         ),
              //         SizedBox(width: 5),
              //         Text(
              //           'Settings',
              //           style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //                 color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
              //               ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  // boxShadow: [
                  //   context.read<SwitchPageCubit>().state.selectedPage == 4
                  //       ? BoxShadow(
                  //           color: Colors.grey.withValues(alpha: 0.2),
                  //           spreadRadius: 10,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                  //         )
                  //       : BoxShadow(
                  //
                  //           // Décalage horizontal et vertical de l'ombre
                  //           )
                  // ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    context.read<SwitchPageCubit>().switchPage(4);
                    context.go('/promote');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent; // Pas d'effet au survol
                        }
                        return null; // Laisser les autres états par défaut
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/administrator.png",
                        width: 20,
                        height: 20,
                        color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Plateform Administration',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

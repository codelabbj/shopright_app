import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../constantes/const.dart';
import '../../../cubits/switch_page/switch_page_cubit.dart';
import '../../../cubits/switch_page/switch_page_state.dart';

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
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: Const.screenWidth(context) * 0.19,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  context.read<SwitchPageCubit>().state.selectedPage == 0
                      ? BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                        )
                      : BoxShadow(

                          // Décalage horizontal et vertical de l'ombre
                          )
                ],
                color: context.read<SwitchPageCubit>().state.selectedPage == 0 ? Theme.of(context).colorScheme.primary : Colors.grey[200],
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
                      color: context.read<SwitchPageCubit>().state.selectedPage == 0 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: context.read<SwitchPageCubit>().state.selectedPage == 0 ? Colors.white : Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: Const.screenWidth(context) * 0.19,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  context.read<SwitchPageCubit>().state.selectedPage == 1
                      ? BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                        )
                      : context.read<SwitchPageCubit>().state.selectedPage == 6
                          ? BoxShadow()
                          : context.read<SwitchPageCubit>().state.selectedPage == 7
                              ? BoxShadow()
                              : context.read<SwitchPageCubit>().state.selectedPage == 7
                                  ? BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.2),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  : BoxShadow(),
                ],
                color: context.read<SwitchPageCubit>().state.selectedPage == 1
                    ? Theme.of(context).colorScheme.primary
                    : context.read<SwitchPageCubit>().state.selectedPage == 6
                        ? Colors.grey[200]
                        : context.read<SwitchPageCubit>().state.selectedPage == 7
                            ? Colors.grey[200]
                            : context.read<SwitchPageCubit>().state.selectedPage == 7
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[200],
              ),
              child: TextButton(
                onPressed: () {
                  context.read<SwitchPageCubit>().switchPage(1);
                  // context.go('/products');
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
                      "assets/images/product.png",
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: Const.screenWidth(context) * 0.1,
                      child: Text(
                        'Products',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 1 ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.read<SwitchPageCubit>().state.selectedPage == 1 ||
                    context.read<SwitchPageCubit>().state.selectedPage == 6 ||
                    context.read<SwitchPageCubit>().state.selectedPage == 7
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: Const.screenWidth(context) * 0.19,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              context.read<SwitchPageCubit>().state.selectedPage == 6
                                  ? BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.2),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                                    )
                                  : BoxShadow(

                                      // Décalage horizontal et vertical de l'ombre
                                      )
                            ],
                            color: context.read<SwitchPageCubit>().state.selectedPage == 6 ? Theme.of(context).colorScheme.primary : Colors.grey[200],
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.read<SwitchPageCubit>().switchPage(6);
                              context.go('/products');
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
                                Icon(
                                  Icons.subdirectory_arrow_right,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 6 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  width: Const.screenWidth(context) * 0.1,
                                  child: Text(
                                    'Listes',
                                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                          color: context.read<SwitchPageCubit>().state.selectedPage == 6 ? Colors.white : Colors.black,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: Const.screenWidth(context) * 0.19,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              context.read<SwitchPageCubit>().state.selectedPage == 7
                                  ? BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.2),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                                    )
                                  : BoxShadow(

                                      // Décalage horizontal et vertical de l'ombre
                                      )
                            ],
                            color: context.read<SwitchPageCubit>().state.selectedPage == 7 ? Theme.of(context).colorScheme.primary : Colors.grey[200],
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.read<SwitchPageCubit>().switchPage(7);
                              context.go('/add-product');
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
                                Icon(
                                  Icons.subdirectory_arrow_right,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 7 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  width: Const.screenWidth(context) * 0.1,
                                  child: Text(
                                    'Ajouter',
                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          color: context.read<SwitchPageCubit>().state.selectedPage == 7 ? Colors.white : Colors.black,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: Const.screenWidth(context) * 0.19,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  context.read<SwitchPageCubit>().state.selectedPage == 2
                      ? BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                        )
                      : BoxShadow(

                          // Décalage horizontal et vertical de l'ombre
                          )
                ],
                color: context.read<SwitchPageCubit>().state.selectedPage == 2 ? Theme.of(context).colorScheme.primary : Colors.grey[200],
              ),
              child: TextButton(
                onPressed: () {
                  context.read<SwitchPageCubit>().switchPage(2);
                  context.go('/document/List_document');
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
                      "assets/images/increase.png",
                      color: context.read<SwitchPageCubit>().state.selectedPage == 2 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: Const.screenWidth(context) * 0.1,
                      child: Text(
                        'Income',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 2 ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: Const.screenWidth(context) * 0.19,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  context.read<SwitchPageCubit>().state.selectedPage == 3
                      ? BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                        )
                      : BoxShadow(

                          // Décalage horizontal et vertical de l'ombre
                          )
                ],
                color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.grey[200],
              ),
              child: TextButton(
                onPressed: () {
                  context.read<SwitchPageCubit>().switchPage(3);
                  context.go('/orders');
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
                      "assets/images/shopping-cart.png",
                      width: 20,
                      height: 20,
                      color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: Const.screenWidth(context) * 0.1,
                      child: Text(
                        'Orders',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: Const.screenWidth(context) * 0.19,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  context.read<SwitchPageCubit>().state.selectedPage == 4
                      ? BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                        )
                      : BoxShadow(

                          // Décalage horizontal et vertical de l'ombre
                          )
                ],
                color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.grey[200],
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
                      "assets/images/discount.png",
                      width: 20,
                      height: 20,
                      color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey.withValues(alpha: 0.2),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: Const.screenWidth(context) * 0.1,
                      child: Text(
                        'Promote',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   width: Const.screenWidth(context) * 0.19,
            //   height: 35,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(6),
            //     border: Border.all(color: Colors.grey.shade300),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.redAccent.withOpacity(0.2),
            //         blurRadius: 4,
            //         offset: Offset(0, 2),
            //       )
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       Icon(Icons.logout, color: Colors.red),
            //       SizedBox(width: 5),
            //       SizedBox(
            //         width: Const.screenWidth(context) * 0.1,
            //         child: Text(
            //           "Déconnexion",
            //           style: Theme.of(context).textTheme.displayMedium?.copyWith(
            //                 color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.black,
            //               ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

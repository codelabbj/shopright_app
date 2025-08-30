import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class EcomDrawerWidget extends StatefulWidget {
  const EcomDrawerWidget({super.key});

  @override
  State<EcomDrawerWidget> createState() => _EcomDrawerWidgetState();
}

class _EcomDrawerWidgetState extends State<EcomDrawerWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchPageCubit, SwitchPageState>(
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context) * 0.19,
                height: 35,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    // context.read<SwitchPageCubit>().state.selectedPage == 1
                    //     ? BoxShadow(
                    //         color: Colors.grey.withValues(alpha: 0.2),
                    //         spreadRadius: 10,
                    //         blurRadius: 10,
                    //         offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
                    //       )
                    //     : context.read<SwitchPageCubit>().state.selectedPage == 6
                    //         ? BoxShadow()
                    //         : context.read<SwitchPageCubit>().state.selectedPage == 7
                    //             ? BoxShadow()
                    //             : context.read<SwitchPageCubit>().state.selectedPage == 7
                    //                 ? BoxShadow(
                    //                     color: Colors.grey.withValues(alpha: 0.2),
                    //                     spreadRadius: 10,
                    //                     blurRadius: 10,
                    //                     offset: Offset(0, 3),
                    //                   )
                    //                 : BoxShadow(),
                  ],
                  color: context.read<SwitchPageCubit>().state.selectedPage == 23
                      ? Colors.transparent
                      : context.read<SwitchPageCubit>().state.selectedPage == 24
                          ? Colors.transparent
                          : context.read<SwitchPageCubit>().state.selectedPage == 25
                              ? Colors.transparent
                              : context.read<SwitchPageCubit>().state.selectedPage == 26
                                  ? Colors.transparent
                                  : context.read<SwitchPageCubit>().state.selectedPage == 27
                                      ? Colors.transparent
                                      : context.read<SwitchPageCubit>().state.selectedPage == 28
                                          ? Colors.transparent
                                          : context.read<SwitchPageCubit>().state.selectedPage == 29
                                              ? Colors.transparent
                                              : context.read<SwitchPageCubit>().state.selectedPage == 30
                                                  ? Colors.transparent
                                                  : context.read<SwitchPageCubit>().state.selectedPage == 31
                                                      ? Colors.transparent
                                                      : context.read<SwitchPageCubit>().state.selectedPage == 31
                                                          ? Theme.of(context).colorScheme.primary
                                                          : Colors.transparent,
                ),
                child: TextButton(
                  onPressed: () {
                    log("Je suis dedans");
                    if (state.selectedPage == 23 || isExpanded) {
                      setState(() {
                        isExpanded = false;
                      });
                    } else {
                      // context.read<SwitchPageCubit>().switchPage(23);
                      setState(() {
                        isExpanded = true;
                      });
                    }
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
                        "assets/images/purchase.png",
                        color: isExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        width: Const.screenWidth(context) * 0.1,
                        child: Text(
                          'Ecommerce',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: isExpanded == true ? Colors.white : Colors.grey[500],
                              ),
                        ),
                      ),
                      Spacer(),
                      isExpanded == true
                          ? InkWell(onTap: () {}, child: Icon(Icons.arrow_drop_down, color: Colors.white))
                          : Icon(
                              Icons.arrow_right,
                              color: Colors.grey[500],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            isExpanded
                // context.read<SwitchPageCubit>().state.selectedPage == 6 ||
                // context.read<SwitchPageCubit>().state.selectedPage == 7
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/business-report.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Report',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 4 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/shopping-bag.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Orders',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/incomplete_order.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Incomplete Orders',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/order_return.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Orders Returns',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/fast-delivery.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  width: Const.screenWidth(context) * 0.1,
                                  child: Text(
                                    'Shipments',
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                        ),
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/invoice.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  width: Const.screenWidth(context) * 0.1,
                                  child: Text(
                                    'Invoices',
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                        ),
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/product.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Products',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/inventory.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Products Inventory',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/categorization.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Product Categories',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/labeling_1.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Product Tags ',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Product Attributes',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/product_option.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Product Option',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/product_collection.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Product Collections',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/labeling_1.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Product Labels',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/brand.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Brands',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/feedback.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Reviews',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/flash.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  width: Const.screenWidth(context) * 0.1,
                                  child: Text(
                                    'Flash Sales',
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                        ),
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/discount_1.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Discounts',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
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
                            // borderRadius: BorderRadius.circular(6),
                            // boxShadow: [
                            //   context.read<SwitchPageCubit>().state.selectedPage == 3
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
                            color:
                                context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
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
                                  "assets/images/community.png",
                                  width: 20,
                                  height: 20,
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Customers',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                        color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox()
          ],
        );
      },
    );
  }
}

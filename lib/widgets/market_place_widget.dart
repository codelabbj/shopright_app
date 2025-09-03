import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class MarketPlaceWidget extends StatefulWidget {
  const MarketPlaceWidget({super.key});

  @override
  State<MarketPlaceWidget> createState() => _MarketPlaceWidgetState();
}

class _MarketPlaceWidgetState extends State<MarketPlaceWidget> {
  // bool isExpanded = false;
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
                ),
                child: TextButton(
                  onPressed: () {
                    if (state.isMaketPlaceExpanded == true) {
                      log('pourquoi 11?');
                      context
                          .read<SwitchPageCubit>()
                          .setMarketPlaceExpanded(false);
                    } else {
                      // context.read<SwitchPageCubit>().switchPage(23);
                      log('pourquoi 1111?');
                      context
                          .read<SwitchPageCubit>()
                          .setMarketPlaceExpanded(true);
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
                        "assets/images/marketplace1.png",
                        color: state.isMaketPlaceExpanded == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Marketplace',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: state.isMaketPlaceExpanded == true
                                      ? Colors.white
                                      : Colors.grey[500],
                                ),
                      ),
                      Spacer(),
                      state.isMaketPlaceExpanded == true
                          ? InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_drop_down,
                                  color: Colors.white))
                          : Icon(
                              Icons.arrow_right,
                              color: Colors.grey[500],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            state.isMaketPlaceExpanded
                // context.read<SwitchPageCubit>().state.selectedPage == 6 ||
                // context.read<SwitchPageCubit>().state.selectedPage == 7
                ? Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color: context
                                      .read<SwitchPageCubit>()
                                      .state
                                      .selectedPage ==
                                  3.1
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(3.1);
                            context.go('/marketplace/reports');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors
                                      .transparent; // Pas d'effet au survol
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
                                color: context
                                            .read<SwitchPageCubit>()
                                            .state
                                            .selectedPage ==
                                        3.1
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Reports',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: context
                                                  .read<SwitchPageCubit>()
                                                  .state
                                                  .selectedPage ==
                                              3.1
                                          ? Colors.white
                                          : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color: context
                                      .read<SwitchPageCubit>()
                                      .state
                                      .selectedPage ==
                                  3.2
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(3.2);
                            context.go('/marketplace/stores');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors
                                      .transparent; // Pas d'effet au survol
                                }
                                return null; // Laisser les autres états par défaut
                              },
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/marketplace1.png",
                                height: 20,
                                color: context
                                            .read<SwitchPageCubit>()
                                            .state
                                            .selectedPage ==
                                        3.2
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Stores',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: context
                                                  .read<SwitchPageCubit>()
                                                  .state
                                                  .selectedPage ==
                                              3.2
                                          ? Colors.white
                                          : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color: context
                                      .read<SwitchPageCubit>()
                                      .state
                                      .selectedPage ==
                                  3.3
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(3.3);
                            context.go('/marketplace/withdrawals');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors
                                      .transparent; // Pas d'effet au survol
                                }
                                return null; // Laisser les autres états par défaut
                              },
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/money.png",
                                width: 20,
                                height: 20,
                                color: context
                                            .read<SwitchPageCubit>()
                                            .state
                                            .selectedPage ==
                                        3.3
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Withdrawals',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: context
                                                  .read<SwitchPageCubit>()
                                                  .state
                                                  .selectedPage ==
                                              3.3
                                          ? Colors.white
                                          : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color: context
                                      .read<SwitchPageCubit>()
                                      .state
                                      .selectedPage ==
                                  3.4
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(3.4);
                            context.go('/marketplace/vendors');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors
                                      .transparent; // Pas d'effet au survol
                                }
                                return null; // Laisser les autres états par défaut
                              },
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/customer.png",
                                width: 20,
                                height: 20,
                                color: context
                                            .read<SwitchPageCubit>()
                                            .state
                                            .selectedPage ==
                                        3.4
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Vendors',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: context
                                                  .read<SwitchPageCubit>()
                                                  .state
                                                  .selectedPage ==
                                              3.4
                                          ? Colors.white
                                          : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color: context
                                      .read<SwitchPageCubit>()
                                      .state
                                      .selectedPage ==
                                  3.5
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(3.5);
                            context.go('/marketplace/unverified-vendors');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors
                                      .transparent; // Pas d'effet au survol
                                }
                                return null; // Laisser les autres états par défaut
                              },
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/information.png",
                                width: 20,
                                height: 20,
                                color: context
                                            .read<SwitchPageCubit>()
                                            .state
                                            .selectedPage ==
                                        3.5
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Unverified vendors',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: context
                                                  .read<SwitchPageCubit>()
                                                  .state
                                                  .selectedPage ==
                                              3.5
                                          ? Colors.white
                                          : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color: context
                                      .read<SwitchPageCubit>()
                                      .state
                                      .selectedPage ==
                                  3.6
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(3.6);
                            context.go('/marketplace/messages');
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors
                                      .transparent; // Pas d'effet au survol
                                }
                                return null; // Laisser les autres états par défaut
                              },
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/messenger1.png",
                                width: 20,
                                height: 20,
                                color: context
                                            .read<SwitchPageCubit>()
                                            .state
                                            .selectedPage ==
                                        3.6
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Messages',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: context
                                                  .read<SwitchPageCubit>()
                                                  .state
                                                  .selectedPage ==
                                              3.6
                                          ? Colors.white
                                          : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox()
          ],
        );
      },
    );
  }
}

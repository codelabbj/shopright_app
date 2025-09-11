import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class TransactionDrawerWidget extends StatefulWidget {
  const TransactionDrawerWidget({super.key});

  @override
  State<TransactionDrawerWidget> createState() => _TransactionDrawerWidgetState();
}

class _TransactionDrawerWidgetState extends State<TransactionDrawerWidget> {
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
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context),
                height: 35,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(6),
                  boxShadow: [],
                ),
                child: TextButton(
                  onPressed: () {
                    if (state.isTransactionExpanded == true) {
                      context.read<SwitchPageCubit>().setTransExpanded(false);
                    } else {
                      context.read<SwitchPageCubit>().setTransExpanded(true);
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
                        "assets/images/atm-card.png",
                        color: state.isTransactionExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Payments',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: state.isTransactionExpanded == true ? Colors.white : Colors.grey[500],
                            ),
                      ),
                      Spacer(),
                      state.isTransactionExpanded == true
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
            state.isTransactionExpanded
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: Const.screenWidth(context),
                        height: 35,
                        decoration: BoxDecoration(
                          color:
                              context.read<SwitchPageCubit>().state.selectedPage == 7.1 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(7.1);
                            context.go('/payments/transactions');
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
                                "assets/images/folder.png",
                                width: 20,
                                height: 20,
                                color: context.read<SwitchPageCubit>().state.selectedPage == 7.1 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Transactions',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 7.1 ? Colors.white : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: Const.screenWidth(context),
                        height: 35,
                        decoration: BoxDecoration(
                          color:
                              context.read<SwitchPageCubit>().state.selectedPage == 7.2 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(7.2);
                            context.go('/payments/payment-logs');
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
                                "assets/images/groups.png",
                                height: 20,
                                color: context.read<SwitchPageCubit>().state.selectedPage == 7.2 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Payment logs',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 7.2 ? Colors.white : Colors.grey[500],
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(vertical: 10),
                      //   width: Const.screenWidth(context) * 0.19,
                      //   height: 35,
                      //   decoration: BoxDecoration(
                      //     color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                      //   ),
                      //   child: TextButton(
                      //     onPressed: () {
                      //       context.read<SwitchPageCubit>().switchPage(3);
                      //       context.go('/orders');
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
                      //           "assets/images/database-table.png",
                      //           width: 20,
                      //           height: 20,
                      //           color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                      //         ),
                      //         SizedBox(width: 5),
                      //         Text(
                      //           'Payment Methods',
                      //           style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      //                 color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Colors.white : Colors.grey[500],
                      //               ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : SizedBox()
          ],
        );
      },
    );
  }
}

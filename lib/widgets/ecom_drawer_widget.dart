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
  // bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchPageCubit, SwitchPageState>(builder: (context, state) {
      return Column(children: [
        InkWell(
          onTap: () {},
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            padding: EdgeInsets.symmetric(vertical: 10),
            width: Const.screenWidth(context) * 0.19,
            height: 35,

            child: TextButton(
              onPressed: () {
                log("Je suis dedans");
                if (state.isEcomExpanded == true) {
                  context.read<SwitchPageCubit>().setEcomExpanded(false);
                } else {
                  context.read<SwitchPageCubit>().setEcomExpanded(true);
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
                    color: state.isEcomExpanded == true ? Colors.white : Colors.grey[500],
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: Const.screenWidth(context) * 0.1,
                    child: Text(
                      'Ecommerce',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: state.isEcomExpanded == true ? Colors.white : Colors.grey[500],
                          ),
                    ),
                  ),
                  Spacer(),
                  state.isEcomExpanded == true
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
        state.isEcomExpanded
            ? Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.101 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.101);
                        context.go('/ecommerce/reports');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.101 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Report',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.101 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.2 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.2);
                        context.go('/ecommerce/orders');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.2 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Orders',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.2 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.3);
                        context.go('/ecommerce/order-incomplete');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.3 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Incomplete Orders',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.3 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.4);
                        context.go('/ecommerce/order-returns');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.4 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Orders Returns',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.4 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.5 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.5);
                        context.go('/ecommerce/shipments');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.5 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: Const.screenWidth(context) * 0.1,
                            child: Text(
                              'Shipments',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    color: context.read<SwitchPageCubit>().state.selectedPage == 1.5 ? Colors.white : Colors.grey[500],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.6 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.6);
                        context.go('/ecommerce/invoices');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.6 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: Const.screenWidth(context) * 0.1,
                            child: Text(
                              'Invoices',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    color: context.read<SwitchPageCubit>().state.selectedPage == 1.6 ? Colors.white : Colors.grey[500],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.7 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.7);
                        context.go('/ecommerce/products');
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
                            "assets/images/boxes.png",
                            width: 20,
                            height: 20,
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.7 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: Const.screenWidth(context) * 0.1,
                            child: Text(
                              'Products',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    color: context.read<SwitchPageCubit>().state.selectedPage == 1.7 ? Colors.white : Colors.grey[500],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.9 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.9);
                        context.go('/ecommerce/product-categorie');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.9 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Product Categories',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.9 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.10 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.10);
                        context.go('/ecommerce/product-tags');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.10 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Product Tags ',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.10 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.14 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.14);
                        context.go('/ecommerce/brands');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.14 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Brands',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.14 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.15 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.15);
                        context.go('/ecommerce/reviews');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.15 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Reviews',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.15 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.16 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.16);
                        context.go('/ecommerce/flash-sales');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.16 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: Const.screenWidth(context) * 0.1,
                            child: Text(
                              'Flash Sales',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    color: context.read<SwitchPageCubit>().state.selectedPage == 1.16 ? Colors.white : Colors.grey[500],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  //   width: Const.screenWidth(context) * 0.19,
                  //   height: 35,
                  //   decoration: BoxDecoration(
                  //     color:
                  //         context.read<SwitchPageCubit>().state.selectedPage == 1.17 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                  //   ),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       context.read<SwitchPageCubit>().switchPage(1.17);
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
                  //           "assets/images/discount_1.png",
                  //           width: 20,
                  //           height: 20,
                  //           color: context.read<SwitchPageCubit>().state.selectedPage == 1.17 ? Colors.white : Colors.grey[500],
                  //         ),
                  //         SizedBox(width: 5),
                  //         Text(
                  //           'Discounts',
                  //           style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  //                 color: context.read<SwitchPageCubit>().state.selectedPage == 1.17 ? Colors.white : Colors.grey[500],
                  //               ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    width: Const.screenWidth(context) * 0.19,
                    height: 35,
                    decoration: BoxDecoration(
                      color: context.read<SwitchPageCubit>().state.selectedPage == 1.18 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<SwitchPageCubit>().switchPage(1.18);
                        context.go('/ecommerce/customers');
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
                            color: context.read<SwitchPageCubit>().state.selectedPage == 1.18 ? Colors.white : Colors.grey[500],
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Customers',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: context.read<SwitchPageCubit>().state.selectedPage == 1.18 ? Colors.white : Colors.grey[500],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ]);
    });
  }
}

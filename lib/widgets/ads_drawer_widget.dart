// import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class AdsDrawerWidget extends StatefulWidget {
  const AdsDrawerWidget({super.key});

  @override
  State<AdsDrawerWidget> createState() => _AdsDrawerWidgetState();
}

class _AdsDrawerWidgetState extends State<AdsDrawerWidget> {
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

                child: TextButton(
                  onPressed: () {
                    if (state.isAdsExpanded == true) {
                      context.read<SwitchPageCubit>().setAdsExpanded(false);
                    } else {
                      context.read<SwitchPageCubit>().setAdsExpanded(true);
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
                        "assets/images/advertising-banner.png",
                        color: state.isAdsExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Ads',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: state.isAdsExpanded == true ? Colors.white : Colors.grey[500],
                            ),
                      ),
                      Spacer(),
                      state.isAdsExpanded == true
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
            state.isAdsExpanded
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          color:
                              context.read<SwitchPageCubit>().state.selectedPage == 9.1 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(9.1);
                            context.go('/ads');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 9.1 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Ads',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 9.1 ? Colors.white : Colors.grey[500],
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
                              context.read<SwitchPageCubit>().state.selectedPage == 9.2 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(9.2);
                            context.go('/ads/settings');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 9.2 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Ads Settings',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 9.2 ? Colors.white : Colors.grey[500],
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

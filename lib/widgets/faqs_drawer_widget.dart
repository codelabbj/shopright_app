import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class FaqsDrawerWidget extends StatefulWidget {
  const FaqsDrawerWidget({super.key});

  @override
  State<FaqsDrawerWidget> createState() => _FaqsDrawerWidgetState();
}

class _FaqsDrawerWidgetState extends State<FaqsDrawerWidget> {
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
                ),
                child: TextButton(
                  onPressed: () {
                    if (state.isFaqExpanded == true) {
                      context.read<SwitchPageCubit>().setFaqExpanded(false);
                    } else {
                      context.read<SwitchPageCubit>().setFaqExpanded(true);
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
                        "assets/images/faq.png",
                        color: state.isFaqExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'FAQs',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: state.isFaqExpanded == true ? Colors.white : Colors.grey[500],
                            ),
                      ),
                      Spacer(),
                      state.isFaqExpanded == true
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
            state.isFaqExpanded
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
                              context.read<SwitchPageCubit>().state.selectedPage == 11.1 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(11.1);
                            context.go('/faqs');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 11.1 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'FAQs',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 11.1 ? Colors.white : Colors.grey[500],
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
                              context.read<SwitchPageCubit>().state.selectedPage == 11.2 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(11.2);
                            context.go('/faqs/categories');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 11.2 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Categories',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 11.2 ? Colors.white : Colors.grey[500],
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

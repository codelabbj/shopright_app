// import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class ContactDrawerWidget extends StatefulWidget {
  const ContactDrawerWidget({super.key});

  @override
  State<ContactDrawerWidget> createState() => _ContactDrawerWidgetState();
}

class _ContactDrawerWidgetState extends State<ContactDrawerWidget> {
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
                    if (state.isContactExpanded == true) {
                      context.read<SwitchPageCubit>().setContactExpanded(false);
                    } else {
                      context.read<SwitchPageCubit>().setContactExpanded(true);
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
                        "assets/images/newsletter.png",
                        color: state.isContactExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Contact',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: state.isContactExpanded == true ? Colors.white : Colors.grey[500],
                            ),
                      ),
                      Spacer(),
                      state.isContactExpanded == true
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
            state.isContactExpanded
                // context.read<SwitchPageCubit>().state.selectedPage == 6 ||
                // context.read<SwitchPageCubit>().state.selectedPage == 7
                ? Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
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
                              context.read<SwitchPageCubit>().state.selectedPage == 6.1 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(6.1);
                            context.go('/contacts');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 6.1 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Contacts',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 6.1 ? Colors.white : Colors.grey[500],
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
                          color: context.read<SwitchPageCubit>().state.selectedPage == 3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(6.2);
                            context.go('/contacts/custom-fields');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 6.2 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Custom Fields',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 6.2 ? Colors.white : Colors.grey[500],
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

import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class ToolsDrawerWidget extends StatefulWidget {
  const ToolsDrawerWidget({super.key});

  @override
  State<ToolsDrawerWidget> createState() => _ToolsDrawerWidgetState();
}

class _ToolsDrawerWidgetState extends State<ToolsDrawerWidget> {
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
                width: Const.screenWidth(context),
                height: 35,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    if (state.isToolExpanded == true) {
                      context.read<SwitchPageCubit>().setToolExpanded(false);
                    } else {
                      // context.read<SwitchPageCubit>().switchPage(23);
                      context.read<SwitchPageCubit>().setToolExpanded(true);
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
                        "assets/images/wrench.png",
                        color: state.isToolExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Tools',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: state.isToolExpanded == true ? Colors.white : Colors.grey[500],
                            ),
                      ),
                      Spacer(),
                      state.isToolExpanded == true
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
            state.isToolExpanded
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: Const.screenWidth(context),
                        height: 35,
                        decoration: BoxDecoration(
                          color:
                              context.read<SwitchPageCubit>().state.selectedPage == 8.9 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(8.9);
                            context.go('/tools/export-import');
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
                                "assets/images/telecharger.png",
                                width: 20,
                                height: 20,
                                color: context.read<SwitchPageCubit>().state.selectedPage == 8.9 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Export/Import Data',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 8.9 ? Colors.white : Colors.grey[500],
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

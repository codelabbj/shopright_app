import 'dart:developer';

import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constantes/const.dart';
import '../cubits/switch_page/switch_page_cubit.dart';

class LocationsDrawerWidget extends StatefulWidget {
  const LocationsDrawerWidget({super.key});

  @override
  State<LocationsDrawerWidget> createState() => _LocationsDrawerWidgetState();
}

class _LocationsDrawerWidgetState extends State<LocationsDrawerWidget> {
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
                padding: EdgeInsets.symmetric(vertical: 10),
                width: Const.screenWidth(context),
                height: 35,
                decoration: BoxDecoration(),
                child: TextButton(
                  onPressed: () {
                    if (state.selectedPage == 9 || state.isLocationExpanded == true) {
                      context.read<SwitchPageCubit>().setLocationExpanded(false);
                    } else {
                      context.read<SwitchPageCubit>().setLocationExpanded(true);
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
                        "assets/images/globe.png",
                        color: state.isLocationExpanded == true ? Colors.white : Colors.grey[500],
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Locations',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: state.isLocationExpanded == true ? Colors.white : Colors.grey[500],
                            ),
                      ),
                      Spacer(),
                      state.isLocationExpanded == true
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
            state.isLocationExpanded
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: Const.screenWidth(context),
                        height: 35,
                        decoration: BoxDecoration(
                          color:
                              context.read<SwitchPageCubit>().state.selectedPage == 8.1 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(8.1);
                            context.go('/locations/countries');
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
                                "assets/images/countries.png",
                                width: 20,
                                height: 20,
                                color: context.read<SwitchPageCubit>().state.selectedPage == 8.1 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Countries',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 8.1 ? Colors.white : Colors.grey[500],
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
                              context.read<SwitchPageCubit>().state.selectedPage == 8.2 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(8.2);
                            context.go('/locations/states');
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
                                "assets/images/placeholder.png",
                                height: 20,
                                color: context.read<SwitchPageCubit>().state.selectedPage == 8.2 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'States',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 8.2 ? Colors.white : Colors.grey[500],
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
                              context.read<SwitchPageCubit>().state.selectedPage == 8.3 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(8.3);
                            context.go('/locations/cities');
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
                                "assets/images/placeholder.png",
                                width: 20,
                                height: 20,
                                color: context.read<SwitchPageCubit>().state.selectedPage == 8.3 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Cities',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 8.3 ? Colors.white : Colors.grey[500],
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
                              context.read<SwitchPageCubit>().state.selectedPage == 8.4 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(8.4);
                            context.go('/locations/importer');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 8.4 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Location importer',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 8.4 ? Colors.white : Colors.grey[500],
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
                              context.read<SwitchPageCubit>().state.selectedPage == 8.5 ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<SwitchPageCubit>().switchPage(8.5);
                            context.go('/tools/export-locations');
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
                                color: context.read<SwitchPageCubit>().state.selectedPage == 8.5 ? Colors.white : Colors.grey[500],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Location Exporter',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: context.read<SwitchPageCubit>().state.selectedPage == 8.5 ? Colors.white : Colors.grey[500],
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

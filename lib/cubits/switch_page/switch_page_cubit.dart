import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';

class SwitchPageCubit extends Cubit<SwitchPageState> {
  SwitchPageCubit()
      : super(SwitchPageState
            .initial()); // Par défaut, on commence à la page 0 (Dashboard)
  void switchPage(double pageIndex) {
    emit(state.copyWith(
      selectedPage: pageIndex,
      isSpecExpanded:
          (pageIndex == 2.1 || pageIndex == 2.2 || pageIndex == 2.3),
      isMaketPlaceExpanded: (pageIndex == 3.1 ||
          pageIndex == 3.2 ||
          pageIndex == 3.3 ||
          pageIndex == 3.4 ||
          pageIndex == 3.5),
      isSettingsExpanded: (pageIndex == 4.1 || pageIndex == 4.2),
    ));
    log('Page switched to $pageIndex');
  }

  void setSpecExpanded(bool isExpanded) {
    emit(state.copyWith(isSpecExpanded: isExpanded));
  }

  void setMarketPlaceExpanded(bool isExpanded) {
    emit(state.copyWith(isMaketPlaceExpanded: isExpanded));
  }

  void setSettingsExpanded(bool isMaketPlaceExpanded) {
    emit(state.copyWith(isSettingsExpanded: isMaketPlaceExpanded));
  }
}

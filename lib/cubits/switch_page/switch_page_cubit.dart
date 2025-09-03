import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';

class SwitchPageCubit extends Cubit<SwitchPageState> {
  SwitchPageCubit() : super(SwitchPageState.initial()); // Par défaut, on commence à la page 0 (Dashboard)
  void switchPage(double pageIndex) {
    emit(state.copyWith(
      selectedPage: pageIndex,
      isEcomExpanded: (pageIndex == 1.1 ||
          pageIndex == 1.2 ||
          pageIndex == 1.3 ||
          pageIndex == 1.4 ||
          pageIndex == 1.5 ||
          pageIndex == 1.6 ||
          pageIndex == 1.7 ||
          pageIndex == 1.8 ||
          pageIndex == 1.9),
      isSpecExpanded: (pageIndex == 2.1 || pageIndex == 2.2 || pageIndex == 2.3),
      isMaketPlaceExpanded: (pageIndex == 3.1 || pageIndex == 3.2 || pageIndex == 3.3 || pageIndex == 3.4 || pageIndex == 3.5 || pageIndex == 3.6),
      isSettingsExpanded: (pageIndex == 4.1 || pageIndex == 4.2),
      isBlogExpanded: (pageIndex == 5.1 || pageIndex == 5.2 || pageIndex == 5.3),
      isContactExpanded: (pageIndex == 6.1 || pageIndex == 6.2),
      isFaqExpanded: (pageIndex == 11.1 || pageIndex == 11.2),
      isAdsExpanded: (pageIndex == 9.1 || pageIndex == 9.2),
    ));
    log('Page switched to $pageIndex');
  }

  void setEcomExpanded(bool isExpanded) {
    emit(state.copyWith(isEcomExpanded: isExpanded));
  }

  void setSpecExpanded(bool isExpanded) {
    emit(state.copyWith(isSpecExpanded: isExpanded));
  }

  void setMarketPlaceExpanded(bool isExpanded) {
    emit(state.copyWith(isMaketPlaceExpanded: isExpanded));
  }

  void setBlogExpanded(bool isExpanded) {
    emit(state.copyWith(isBlogExpanded: isExpanded));
  }

  void setAdsExpanded(bool isExpanded) {
    emit(state.copyWith(isAdsExpanded: isExpanded));
  }

  void setFaqExpanded(bool isExpanded) {
    emit(state.copyWith(isFaqExpanded: isExpanded));
  }

  void setSettingsExpanded(bool isExpanded) {
    emit(state.copyWith(isSettingsExpanded: isExpanded));
  }

  void setContactExpanded(bool isExpanded) {
    emit(state.copyWith(isContactExpanded: isExpanded));
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_com_app/cubits/switch_page/switch_page_state.dart';

class SwitchPageCubit extends Cubit<SwitchPageState> {
  SwitchPageCubit() : super(SwitchPageState.initial()); // Par défaut, on commence à la page 0 (Dashboard)
  void switchPage(int pageIndex) {
    emit(state.copyWith(selectedPage: pageIndex));
    log('Page switched to $pageIndex');
  }
}

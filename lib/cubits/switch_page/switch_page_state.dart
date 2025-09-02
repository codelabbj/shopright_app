import 'package:equatable/equatable.dart';

class SwitchPageState extends Equatable {
  final double selectedPage;
  final bool isSpecExpanded;
  final bool isMaketPlaceExpanded;
  final bool isSettingsExpanded;

  const SwitchPageState({
    required this.selectedPage,
    this.isSpecExpanded = false,
    this.isMaketPlaceExpanded = false,
    this.isSettingsExpanded = false,
  });

  factory SwitchPageState.initial() {
    return const SwitchPageState(
      selectedPage: 0,
    );
  }

  SwitchPageState copyWith({
    double? selectedPage,
    bool? isSpecExpanded,
    bool? isMaketPlaceExpanded,
    bool? isSettingsExpanded,
  }) {
    return SwitchPageState(
      selectedPage: selectedPage ?? this.selectedPage,
      isSpecExpanded: isSpecExpanded ?? this.isSpecExpanded,
      isMaketPlaceExpanded: isMaketPlaceExpanded ?? this.isMaketPlaceExpanded,
      isSettingsExpanded: isSettingsExpanded ?? this.isSettingsExpanded,
    );
  }

  @override
  List<Object> get props => [
        selectedPage,
        isSpecExpanded,
        isMaketPlaceExpanded,
        isSettingsExpanded,
      ];
}

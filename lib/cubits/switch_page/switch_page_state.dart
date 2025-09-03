import 'package:equatable/equatable.dart';

class SwitchPageState extends Equatable {
  final double selectedPage;
  final bool isEcomExpanded;
  final bool isSpecExpanded;
  final bool isMaketPlaceExpanded;
  final bool isSettingsExpanded;
  final bool isContactExpanded;
  final bool isBlogExpanded;
  final bool isAdsExpanded;
  final bool isConctatExpanded;
  final bool isFaqExpanded;

  const SwitchPageState({
    required this.selectedPage,
    this.isEcomExpanded = false,
    this.isSpecExpanded = false,
    this.isMaketPlaceExpanded = false,
    this.isSettingsExpanded = false,
    this.isContactExpanded = false,
    this.isBlogExpanded = false,
    this.isAdsExpanded = false,
    this.isConctatExpanded = false,
    this.isFaqExpanded = false,
  });

  factory SwitchPageState.initial() {
    return const SwitchPageState(
      selectedPage: 0,
    );
  }

  SwitchPageState copyWith({
    double? selectedPage,
    bool? isEcomExpanded,
    bool? isSpecExpanded,
    bool? isMaketPlaceExpanded,
    bool? isSettingsExpanded,
    bool? isBlogExpanded,
    bool? isContactExpanded,
    bool? isAdsExpanded,
    bool? isFaqExpanded,
  }) {
    return SwitchPageState(
      selectedPage: selectedPage ?? this.selectedPage,
      isEcomExpanded: isEcomExpanded ?? this.isEcomExpanded,
      isSpecExpanded: isSpecExpanded ?? this.isSpecExpanded,
      isMaketPlaceExpanded: isMaketPlaceExpanded ?? this.isMaketPlaceExpanded,
      isSettingsExpanded: isSettingsExpanded ?? this.isSettingsExpanded,
      isBlogExpanded: isBlogExpanded ?? this.isBlogExpanded,
      isContactExpanded: isContactExpanded ?? this.isContactExpanded,
      isAdsExpanded: isAdsExpanded ?? this.isAdsExpanded,
      isFaqExpanded: isFaqExpanded ?? this.isFaqExpanded,
    );
  }

  @override
  List<Object> get props => [
        selectedPage,
        isEcomExpanded,
        isSpecExpanded,
        isMaketPlaceExpanded,
        isSettingsExpanded,
        isContactExpanded,
        isBlogExpanded,
        isAdsExpanded,
        isFaqExpanded
      ];
}

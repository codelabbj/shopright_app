import 'package:equatable/equatable.dart';

class SwitchPageState extends Equatable {
  final double selectedPage;
  const SwitchPageState({
    required this.selectedPage,
  });

  factory SwitchPageState.initial() {
    return const SwitchPageState(
      selectedPage: 0,
    );
  }

  SwitchPageState copyWith({
    double? selectedPage,
  }) {
    return SwitchPageState(
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  List<Object> get props => [selectedPage];
}

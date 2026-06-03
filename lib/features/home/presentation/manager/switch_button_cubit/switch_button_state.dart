class SwitchButtonState {
  final bool currentState;

  SwitchButtonState({required this.currentState});
  @override
  String toString() {
    return "SwitchButtonState now is $currentState";
  }

  SwitchButtonState copyWith(bool? currentState) {
    return SwitchButtonState(currentState: currentState ?? this.currentState);
  }
}

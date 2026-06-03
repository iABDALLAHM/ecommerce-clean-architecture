class TermsAndConditionsState {
  final bool isChecked;

  TermsAndConditionsState({required this.isChecked});

  @override
  String toString() {
    return "TermsAndConditionsState now is $isChecked";
  }

  TermsAndConditionsState copyWith(bool? isChecked) {
    return TermsAndConditionsState(isChecked: isChecked ?? this.isChecked);
  }
}

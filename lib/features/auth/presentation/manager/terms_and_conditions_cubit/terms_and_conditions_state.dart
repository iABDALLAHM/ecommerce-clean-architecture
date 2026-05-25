class TermsAndConditionsState {
  final bool isChecked;

  TermsAndConditionsState({required this.isChecked});
  TermsAndConditionsState copyWith(bool? isChecked) {
    return TermsAndConditionsState(isChecked: isChecked ?? this.isChecked);
  }
}

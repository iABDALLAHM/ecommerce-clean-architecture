abstract class SaveRecentSearchSuggestionsState {}

final class InitialRecentSuggestionsState
    extends SaveRecentSearchSuggestionsState {}

final class SuccessGetRecentSuggestionsState
    extends SaveRecentSearchSuggestionsState {
  final List<String> listOfSugestions;

  SuccessGetRecentSuggestionsState({required this.listOfSugestions});
}

final class RecentSuggestionsEmpty extends SaveRecentSearchSuggestionsState {}

abstract class SaveRecentSearchSugestionsState {}

final class InitialRecentSugestionsState
    extends SaveRecentSearchSugestionsState {}

final class SuccessGetRecentSugestionsState
    extends SaveRecentSearchSugestionsState {
  final List<String> listOfSugestions;

  SuccessGetRecentSugestionsState({required this.listOfSugestions});
}

final class RecentSuggestionsEmpty extends SaveRecentSearchSugestionsState {}

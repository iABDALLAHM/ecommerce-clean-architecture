import 'package:ecommerce_clean_architecture/core/repositories/local_storage_repository/local_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/save_recent_search_cubit/save_recent_search_sugestions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveRecentSearchSugestionsCubit
    extends Cubit<SaveRecentSearchSugestionsState> {
  SaveRecentSearchSugestionsCubit({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository,
       super(InitialRecentSugestionsState());

  final LocalStorageRepository _localStorageRepository;

  List<String> listOfSugestions = [];

  static const String storageKey = "recent-sugestions";

  Future<void> saveRecentSugestions({required String recentSugestion}) async {
    listOfSugestions.remove(recentSugestion);
    listOfSugestions.insert(0, recentSugestion);
    if (listOfSugestions.length >= 5) {
      listOfSugestions.removeLast();
    }

    await _localStorageRepository.setStringList(
      key: storageKey,
      data: listOfSugestions,
    );
    emit(SuccessGetRecentSugestionsState(listOfSugestions: listOfSugestions));
  }

  Future<void> getSugestions() async {
    final result = await _localStorageRepository.getStringList(key: storageKey);
    listOfSugestions = result;
    if (result.isEmpty) {
      emit(RecentSuggestionsEmpty());
    } else {
      emit(SuccessGetRecentSugestionsState(listOfSugestions: result));
    }
  }

  Future<void> deleteCurrentSuggestion({required String currentSuggestion}) async {
    listOfSugestions.remove(currentSuggestion);
      await _localStorageRepository.setStringList(
      key: storageKey,
      data: listOfSugestions,
    );
    emit(SuccessGetRecentSugestionsState(listOfSugestions: listOfSugestions));
  }

  Future<void> clearAllSuggestions() async {
    listOfSugestions.clear();
    await _localStorageRepository.setStringList(key: storageKey, data: []);
    emit(RecentSuggestionsEmpty());
  }
}

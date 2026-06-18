class BottomNavigationState {
  final int currentPage;

  BottomNavigationState({required this.currentPage});

  BottomNavigationState copyWith(int? currentPage) {
    return BottomNavigationState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  String toString() {
    return "BottomNavigationState now is $currentPage";
  }
}

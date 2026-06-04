class GetImageState {
  String? image;
  final bool isLoading;

  GetImageState({this.image, required this.isLoading});

  GetImageState copyWith({String? image, bool? isLoading}) {
    return GetImageState(
      image: image ?? this.image,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return "now is $image and $isLoading";
  }
}

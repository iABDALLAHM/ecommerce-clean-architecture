import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/get_image_cubit/get_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit() : super(GetImageState(isLoading: false, image: ""));
  final ImagePicker picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    emit(state.copyWith(isLoading: true, image: ""));

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      emit(state.copyWith(image: image.path, isLoading: false));
    } else {
      emit(state.copyWith(image: "", isLoading: false));
    }
  }

  Future<void> removeImage() async {
    emit(state.copyWith(image: "", isLoading: false));
  }
}

import 'dart:io';
import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/update_user_image_cubit/update_user_image_states.dart';
import 'package:ecommerce_clean_architecture/features/main/data/repositories/images_repository/images_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserImageCubit extends Cubit<UpdateUserImageStates> {
  UpdateUserImageCubit({required this.imagesRepo})
    : super(InitialUpdateUserImageState());
  final ImagesRepository imagesRepo;
  Future<void> updateUserImage({required String image}) async {
    emit(LoadingUpdateUserImageState());
    var result = await imagesRepo.uploadImage(file: File(image));
    result.fold(
      (failure) =>
          emit(FailureUpdateUserImageState(errMessage: failure.message)),
      (imageUrl) {
        emit(SuccessUpdateUserImageState());
      },
    );
  }
}

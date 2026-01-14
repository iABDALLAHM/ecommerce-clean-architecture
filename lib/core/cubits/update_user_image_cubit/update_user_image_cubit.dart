import 'dart:io';
import 'package:ecommerce_clean_architecture/core/cubits/update_user_image_cubit/update_user_image_states.dart';
import 'package:ecommerce_clean_architecture/core/repos/images_repo/images_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserImageCubit extends Cubit<UpdateUserImageStates> {
  UpdateUserImageCubit({required this.imagesRepo})
    : super(InitialUpdateUserImageState());
  final ImagesRepo imagesRepo;
  Future<void> updateUserImage({required File image}) async {
    emit(LoadingUpdateUserImageState());
    var result = await imagesRepo.uploadImage(file: image);
    result.fold(
      (failure) =>
          emit(FailureUpdateUserImageState(errMessage: failure.message)),
      (imageUrl) {
        emit(SuccessUpdateUserImageState());
      },
    );
  }
}

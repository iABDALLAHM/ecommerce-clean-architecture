import 'dart:io';
import 'package:ecommerce_clean_architecture/core/functions/get_user_data.dart';
import 'package:ecommerce_clean_architecture/features/auth/auth.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/core/cubits/update_user_image_cubit/update_user_image_states.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/images_repository/images_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserImageCubit extends Cubit<UpdateUserImageStates> {
  UpdateUserImageCubit({required this.imagesRepo, required this.userRepository})
    : super(InitialUpdateUserImageState());

  final ImagesRepository imagesRepo;
  final UserRepository userRepository;

  Future<void> updateUserImage({required String image}) async {
    emit(LoadingUpdateUserImageState());
    var result = await imagesRepo.uploadImage(file: File(image));

    result.fold(
      (failure) =>
          emit(FailureUpdateUserImageState(errMessage: failure.message)),
      (imageUrl) async {
        
        var result = await userRepository.updateUserData(
          userEntity: UserEntity(
            name: getUserData().name,
            email: getUserData().email,
            uId: getUserData().uId,
            userImage: imageUrl,
          ),
        );
        result.fold(
          (l) => emit(FailureUpdateUserImageState(errMessage: l.message)),
          (success) {
            emit(SuccessUpdateUserImageState());
          },
        );
      },
    );
  }
}

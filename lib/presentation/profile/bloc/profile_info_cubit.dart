import 'package:alphaone/domain/entities/auth/user.dart';
import 'package:alphaone/domain/usecases/auth/get_user.dart';
import 'package:alphaone/presentation/profile/bloc/profile_info_state.dart';
import 'package:alphaone/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await sl<GetUserUseCase>().call();

    user.fold((l) {
      emit(ProfileInfoFailure());
    }, (userEntity) {
      emit(ProfileInfoLoaded(userEntity: userEntity as UserEntity));
    });
  }
}

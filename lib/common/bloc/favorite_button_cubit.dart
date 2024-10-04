import 'package:alphaone/common/bloc/favorite_button_state.dart';
import 'package:alphaone/domain/usecases/song/add_or_remove_favourite_songs.dart';
import 'package:alphaone/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      params: songId,
    );
    result.fold(
      (l) {},
      (isFavorite) {
        emit(
          FavoriteButtonUpdated(
            isFavorite: isFavorite as bool,
          ),
        );
      },
    );
  }
}

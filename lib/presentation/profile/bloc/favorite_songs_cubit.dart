import 'package:alphaone/domain/entities/song/song.dart';
import 'package:alphaone/domain/usecases/song/get_favorite_songs.dart';
import 'package:alphaone/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:alphaone/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongsUseCase>().call();

    result.fold((l) {
      emit(
        FavoriteSongsFailure(),
      );
    }, (r) {
      favoriteSongs = r as List<SongEntity>;
      emit(
        FavoriteSongsLoaded(favoriteSongs: favoriteSongs),
      );
    });
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(
      FavoriteSongsLoaded(favoriteSongs: favoriteSongs),
    );
  }
}

import 'package:alphaone/domain/entities/song/song.dart';
import 'package:alphaone/domain/usecases/song/get_playlist.dart';
import 'package:alphaone/presentation/home/bloc/play_list_state.dart';
import 'package:alphaone/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlaylistUseCase>().call();
    returnedSongs.fold((l) {
      emit(PlayListLoadFailure());
    }, (data) {
      emit(PlayListLoaded(songs: data as List<SongEntity>));
    });
  }
}

import 'package:alphaone/data/repository/auth/auth_repository_impl.dart';
import 'package:alphaone/data/sources/auth/auth_firebase_service.dart';
import 'package:alphaone/domain/repository/auth/auth.dart';
import 'package:alphaone/domain/usecases/auth/get_user.dart';
import 'package:alphaone/domain/usecases/auth/signin.dart';
import 'package:alphaone/domain/usecases/auth/signup.dart';
import 'package:alphaone/domain/usecases/song/add_or_remove_favourite_songs.dart';
import 'package:alphaone/domain/usecases/song/get_favorite_songs.dart';
import 'package:alphaone/domain/usecases/song/get_news_songs.dart';
import 'package:alphaone/domain/usecases/song/get_playlist.dart';
import 'package:alphaone/domain/usecases/song/is_favorite_song.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
    AddOrRemoveFavoriteSongUseCase(),
  );
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  sl.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());
}

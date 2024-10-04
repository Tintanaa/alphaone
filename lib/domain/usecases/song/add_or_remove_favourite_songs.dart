import 'package:alphaone/core/usecase/usecase.dart';
import 'package:alphaone/domain/repository/song/song.dart';
import 'package:alphaone/service_locator.dart';
import 'package:dartz/dartz.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }
}

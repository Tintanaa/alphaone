import 'package:alphaone/core/usecase/usecase.dart';
import 'package:alphaone/domain/repository/song/song.dart';
import 'package:alphaone/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
}

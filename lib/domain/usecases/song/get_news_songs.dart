import 'package:alphaone/core/usecase/usecase.dart';
import 'package:alphaone/domain/repository/song/song.dart';
import 'package:alphaone/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getPlaylist();
  }
}

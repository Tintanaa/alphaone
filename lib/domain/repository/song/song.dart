import 'package:dartz/dartz.dart';

abstract class SongsRepository {
  Future<Either> getPlaylist();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSongs(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
}

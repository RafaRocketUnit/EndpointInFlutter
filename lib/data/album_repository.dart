import 'package:test_endpoint/data/album.dart';
import 'package:test_endpoint/data/album_service.dart';
import 'package:test_endpoint/data/base_service.dart';

class AlbumRepository {
  final BaseService _albumService = AlbumService();

  Future<List<Album>> fetchAlbumList() async {
    dynamic response = await _albumService.getResponse();
    final jsonData = response as List;

    List<Album> albumList =
    jsonData.map((e) => Album.fromJson(e))
        .toList()
        .where((album) => album.name?.isNotEmpty == true)
        .toList();

    return albumList;
  }
}
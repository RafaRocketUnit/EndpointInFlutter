import 'package:test_endpoint/data/album_repository.dart';
import 'package:test_endpoint/domain/album_domain.dart';

class UseCaseListAlbums {

  AlbumRepository albumRepository = AlbumRepository();

  Future<List<AlbumDomain>> invoke() async {
    List<AlbumDomain> albumDomainList = (
        await AlbumRepository()
            .fetchAlbumList()
    ).map((album)  {
      return AlbumDomain(
          listId: album.listId as int,
          name: album.name as String,
          id: album.id as int
      );
    }).toList();

    return albumDomainList;
  }

}
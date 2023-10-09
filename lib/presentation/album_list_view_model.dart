import 'package:flutter/cupertino.dart';
import 'package:test_endpoint/data/api_response.dart';
import 'package:test_endpoint/domain/album_domain.dart';
import 'package:test_endpoint/domain/use_case_list_albums.dart';

import 'album_ui.dart';

class AlbumListViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.loading("Loading...");

  Future<ApiResponse<dynamic>> fetchAlbumData () async {
    try {
      List<AlbumDomain> albumDomainList = await UseCaseListAlbums().invoke();
      List<AlbumUi> albumList = albumDomainList.map((album) {
        return AlbumUi(listId: album.listId, name: album.name, id: album.id);
      }).toList();

      _apiResponse = ApiResponse.completed(albumList);
    } catch (exception) {
      _apiResponse = ApiResponse.error(exception.toString());
    }
    notifyListeners();
    return _apiResponse;
  }

}
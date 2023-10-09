import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_endpoint/data/album.dart';
import 'package:test_endpoint/data/album_service.dart';

class MockAlbumService extends Mock implements AlbumService {}

void main() {
  late MockAlbumService mockAlbumService;

  Future<Album> matcher() async {
    Album album = const Album(listId: 1, name: "name", id: 1);
    return album;
  }

  setUp(() async {
    mockAlbumService = MockAlbumService();
  });

  group("Response", () {
    test("Response of Endpoint", () {
      when(() => mockAlbumService.getResponse()).thenAnswer((_) async => const Album(listId: 1, id: 1, name: "name"));
      final actual = mockAlbumService.getResponse();
      final expected = matcher();
      final test = "";
      expect(actual, expected);
    });
  });


}



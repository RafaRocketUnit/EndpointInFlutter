/// main model
class Album {
  final int? listId;
  final int? id;
  final String? name;

  const Album({
    required this.listId,
    required this.name,
    required this.id
  });

  factory Album.fromJson(Map<String, dynamic> element) {
    return Album(
        listId: element["listId"],
        name: element["name"],
        id: element["id"]
    );
  }
}
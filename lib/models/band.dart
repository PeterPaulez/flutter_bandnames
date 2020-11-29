class BandModel {
  String id;
  String name;
  int votes;

  BandModel({
    this.id,
    this.name,
    this.votes,
  });

  factory BandModel.fromMap(Map<String, dynamic> object) {
    return BandModel(
      id: object.containsKey('id') ? object['id'] : 'no-id',
      name: object.containsKey('name') ? object['name'] : 'no-name',
      votes: object.containsKey('votes') ? object['votes'] : 'no-votes',
    );
  }
}

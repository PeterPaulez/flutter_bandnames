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
      id: object['id'],
      name: object['name'],
      votes: object['votes'],
    );
  }
}

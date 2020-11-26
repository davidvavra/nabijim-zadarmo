class Charger {
  final double latitude;
  final double longitude;

  Charger(this.latitude, this.longitude);

  Charger.fromJson(Map<String, dynamic> json)
      : latitude = json["lat"],
        longitude = json["lng"];

  @override
  String toString() {
    return "{lat=$latitude, long=$longitude}";
  }
}
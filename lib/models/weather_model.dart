class CityModel {
  CityModel({
    required this.name,
    required this.country,
  });

  final String name;
  final String country;

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] as String,
      country: json['country'] as String,
    );
  }
}

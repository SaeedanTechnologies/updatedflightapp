class GetCities {
  final List<CityData> data;

  GetCities({required this.data});

  factory GetCities.fromJson(Map<String, dynamic> json) {
    return GetCities(
      data: (json['data'] as List).map((e) => CityData.fromJson(e)).toList(),
    );
  }
}

class CityData {
  final int id;
  final String title;

  CityData({required this.id, required this.title});

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      id: json['id'],
      title: json['title'],
    );
  }
}

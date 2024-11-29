class GetCountries {
  final List<Country> data;

  GetCountries({required this.data});

  factory GetCountries.fromJson(List<dynamic> json) {
    return GetCountries(
      data: json.map((e) => Country.fromJson(e)).toList(),
    );
  }
}

class CountryData {
  final int id;
  final String title;

  CountryData({required this.id, required this.title});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      id: json['id'],
      title: json['title'],
    );
  }
}

class Country {
  final int id;
  final String title;

  Country({required this.id, required this.title});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      title: json['title'],
    );
  }
}

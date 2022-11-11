class Country {
  final String commonName;
  final String officialName;
  //final bool isIndependent;
  //final String currencyName;
  //final String currencySymbol;

  ///List of Capitals
  var capital;
  var languages;
  final int population;
  final String region;
  final String? subRegion;
  //final String weekStartOn;
  Country({
    required this.commonName,
    required this.officialName,
    required this.capital,
    required this.population,
    required this.region,
    required this.subRegion,
    required this.languages,
    //required this.weekStartOn,
    //required this.isIndependent,
    //required this.currencyName,
    //required this.currencySymbol,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    print(json["startOfWeek"]);
    return Country(
      commonName: json["name"]["common"],
      officialName: json["name"]["official"],
      capital: json["capital"] ?? [],
      population: json["population"],
      region: json["region"],
      subRegion: json["subregion"],
      languages: json["languages"],
      //weekStartOn: json["startOfWeek"],
      //isIndependent: json["tld"]["independent"],
      //currencyName: json["currencies"]["BBD"]["name"],
      //currencySymbol: json["currencies"]["BBD"]["symbol"],
    );
  }
}

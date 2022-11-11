class Country {
  final String? commonName;
  final String? officialName;
  final List<dynamic>? capital;
  final bool? isIndependent;
  final bool? isLandLocked;
  final bool? isUNMember;
  final Map<String, dynamic>? currency;
  final Map<String, dynamic>? flags;
  final List<dynamic>? continents;
  final List<dynamic>? timezones;
  final Map<String, dynamic>? languages;
  final Map<String, dynamic>? carDetails;
  final int? population;
  final String? region;
  final String? subRegion;
  final String? weekStartOn;
  final double? landArea;
  Country({
    required this.commonName,
    required this.officialName,
    required this.capital,
    required this.isIndependent,
    required this.isLandLocked,
    required this.isUNMember,
    required this.currency,
    required this.flags,
    required this.continents,
    required this.timezones,
    required this.languages,
    required this.carDetails,
    required this.population,
    required this.region,
    required this.subRegion,
    required this.weekStartOn,
    required this.landArea,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    //print(json["idd"]["root"] + json["idd"]["suffixes"][0]);
    //print(json["idd"]["root"] + json["idd"]["suffixes"][0]);
    return Country(
      commonName: json["name"]["common"],
      officialName: json["name"]["official"],
      capital: json["capital"],
      isIndependent: json["independent"],
      isLandLocked: json["landlocked"],
      isUNMember: json["unMember"],
      currency: json["currencies"],
      flags: json["flags"],
      continents: json["continents"],
      timezones: json["timezones"],
      languages: json["languages"],
      carDetails: json["car"],
      population: json["population"],
      region: json["region"],
      subRegion: json["subregion"],
      weekStartOn: json["startOfWeek"],
      landArea: json["area"],
    );
  }
}

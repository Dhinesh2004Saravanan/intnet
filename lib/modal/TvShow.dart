class TvShow {
  final double score;
  final ShowDetails? show;

  TvShow({
    required this.score,
    this.show,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      score: json['score'] ?? 0.0,
      show: json['show'] != null ? ShowDetails.fromJson(json['show']) : null,
    );
  }
}

class ShowDetails {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule? schedule;
  final double? averageRating;
  final int weight;
  final Network? network;
  final Externals? externals;
  final ImageDetails? image;
  final String summary;

  ShowDetails({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.averageRating,
    required this.weight,
    this.network,
    this.externals,
    this.image,
    required this.summary,
  });

  factory ShowDetails.fromJson(Map<String, dynamic> json) {
    return ShowDetails(
      id: json['id'] ?? 0,  // Handle null values for required fields
      url: json['url'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      language: json['language'] ?? 'Unknown',  // Default value for language
      genres: List<String>.from(json['genres'] ?? []),  // Default to empty list if null
      status: json['status'] ?? 'Unknown',
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered: json['premiered'],
      ended: json['ended'],
      officialSite: json['officialSite'],
      schedule: json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      averageRating: json['rating']?['average']?.toDouble() ?? 0.0,  // Default to 0.0 if null
      weight: json['weight'] ?? 0,
      network: json['network'] != null ? Network.fromJson(json['network']) : null,
      externals: json['externals'] != null ? Externals.fromJson(json['externals']) : null,
      image: json['image'] != null ? ImageDetails.fromJson(json['image']) : null,
      summary: json['summary'] ?? '',  // Default to empty string if null
    );
  }
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] ?? '',  // Default to empty string if null
      days: List<String>.from(json['days'] ?? []),  // Default to empty list if null
    );
  }
}

class Network {
  final int id;
  final String name;
  final Country country;

  Network({
    required this.id,
    required this.name,
    required this.country,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'] ?? 0,  // Handle null values
      name: json['name'] ?? 'Unknown',  // Default value for network name
      country: json['country'] != null ? Country.fromJson(json['country']) : Country(name: 'Unknown', code: '', timezone: ''),  // Handle null country
    );
  }
}

class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? 'Unknown',  // Default value for country name
      code: json['code'] ?? '',  // Default value for country code
      timezone: json['timezone'] ?? '',  // Default value for timezone
    );
  }
}

class Externals {
  final int? tvrage;
  final int? thetvdb;
  final String imdb;

  Externals({
    this.tvrage,
    this.thetvdb,
    required this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'] ?? '',  // Default value for IMDb
    );
  }
}

class ImageDetails {
  final String medium;
  final String original;

  ImageDetails({
    required this.medium,
    required this.original,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      medium: json['medium'] ?? '',  // Default value for medium image
      original: json['original'] ?? '',  // Default value for original image
    );
  }
}



//
// class TvShow {
//   final double score;
//   final ShowDetails? show;
//
//   TvShow({
//     required this.score,
//     this.show,
//   });
//
//   factory TvShow.fromJson(Map<String, dynamic> json) {
//     return TvShow(
//       score: json['score'] ?? 0.0,
//       show: json['show'] != null ? ShowDetails.fromJson(json['show']) : null,
//     );
//   }
// }
//
// class ShowDetails {
//   final int id;
//   final String url;
//   final String name;
//   final String type;
//   final String language;
//   final List<String> genres;
//   final String status;
//   final int? runtime;
//   final int? averageRuntime;
//   final String? premiered;
//   final String? ended;
//   final String? officialSite;
//   final Schedule? schedule;
//   final double? averageRating;
//   final int weight;
//   final Network? network;
//   final Externals? externals;
//   final ImageDetails? image;
//   final String summary;
//
//   ShowDetails({
//     required this.id,
//     required this.url,
//     required this.name,
//     required this.type,
//     required this.language,
//     required this.genres,
//     required this.status,
//     this.runtime,
//     this.averageRuntime,
//     this.premiered,
//     this.ended,
//     this.officialSite,
//     this.schedule,
//     this.averageRating,
//     required this.weight,
//     this.network,
//     this.externals,
//     this.image,
//     required this.summary,
//   });
//
//   factory ShowDetails.fromJson(Map<String, dynamic> json) {
//     return ShowDetails(
//       id: json['id'],
//       url: json['url'],
//       name: json['name'],
//       type: json['type'],
//       language: json['language'],
//       genres: List<String>.from(json['genres'] ?? []),
//       status: json['status'],
//       runtime: json['runtime'],
//       averageRuntime: json['averageRuntime'],
//       premiered: json['premiered'],
//       ended: json['ended'],
//       officialSite: json['officialSite'],
//       schedule: json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
//       averageRating: json['rating']?['average']?.toDouble(),
//       weight: json['weight'] ?? 0,
//       network: json['network'] != null ? Network.fromJson(json['network']) : null,
//       externals: json['externals'] != null ? Externals.fromJson(json['externals']) : null,
//       image: json['image'] != null ? ImageDetails.fromJson(json['image']) : null,
//       summary: json['summary'] ?? "",
//     );
//   }
// }
//
// // Other classes (Schedule, Network, Country, Externals, ImageDetails) remain the same
// // Ensure all their fields are nullable where appropriate
//
// class Schedule {
//   final String time;
//   final List<String> days;
//
//   Schedule({
//     required this.time,
//     required this.days,
//   });
//
//   factory Schedule.fromJson(Map<String, dynamic> json) {
//     return Schedule(
//       time: json['time'],
//       days: List<String>.from(json['days']),
//     );
//   }
// }
//
// class Network {
//   final int id;
//   final String name;
//   final Country country;
//
//   Network({
//     required this.id,
//     required this.name,
//     required this.country,
//   });
//
//   factory Network.fromJson(Map<String, dynamic> json) {
//     return Network(
//       id: json['id'],
//       name: json['name'],
//       country: Country.fromJson(json['country']),
//     );
//   }
// }
//
// class Country {
//   final String name;
//   final String code;
//   final String timezone;
//
//   Country({
//     required this.name,
//     required this.code,
//     required this.timezone,
//   });
//
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//       name: json['name'],
//       code: json['code'],
//       timezone: json['timezone'],
//     );
//   }
// }
//
// class Externals {
//   final int? tvrage;
//   final int? thetvdb;
//   final String imdb;
//
//   Externals({
//     this.tvrage,
//     this.thetvdb,
//     required this.imdb,
//   });
//
//   factory Externals.fromJson(Map<String, dynamic> json) {
//     return Externals(
//       tvrage: json['tvrage'],
//       thetvdb: json['thetvdb'],
//       imdb: json['imdb'],
//     );
//   }
// }
//
// class ImageDetails {
//   final String medium;
//   final String original;
//
//   ImageDetails({
//     required this.medium,
//     required this.original,
//   });
//
//   factory ImageDetails.fromJson(Map<String, dynamic> json) {
//     return ImageDetails(
//       medium: json['medium'],
//       original: json['original'],
//     );
//   }
// }

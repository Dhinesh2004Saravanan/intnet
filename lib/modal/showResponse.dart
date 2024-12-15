import 'dart:convert';

class ShowResponse {
  final double score;
  final Show show;

  ShowResponse({
    required this.score,
    required this.show,
  });

  factory ShowResponse.fromJson(Map<String, dynamic> json) {
    return ShowResponse(
      score: json['score'] ?? 0.0, // Use 0.0 as a default value if 'score' is null
      show: Show.fromJson(json['show']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'show': show.toJson(),
    };
  }
}

class Show {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int runtime;
  final int averageRuntime;
  final String premiered;
  final String? ended; // Nullable field
  final String officialSite;
  final Schedule schedule;
  final Rating rating;
  final Network network;
  final Externals externals;
  final ShowImage image;
  final String summary;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    this.ended, // Nullable field
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.network,
    required this.externals,
    required this.image,
    required this.summary,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'] ?? '', // Default to empty string if null
      name: json['name'] ?? '', // Default to empty string if null
      type: json['type'] ?? '', // Default to empty string if null
      language: json['language'] ?? '', // Default to empty string if null
      genres: List<String>.from(json['genres'] ?? []), // Default to empty list if null
      status: json['status'] ?? '', // Default to empty string if null
      runtime: json['runtime'] ?? 0, // Default to 0 if null
      averageRuntime: json['averageRuntime'] ?? 0, // Default to 0 if null
      premiered: json['premiered'] ?? '', // Default to empty string if null
      ended: json['ended'], // Nullable field
      officialSite: json['officialSite'] ?? '', // Default to empty string if null
      schedule: Schedule.fromJson(json['schedule'] ?? {}), // Default to empty map if null
      rating: Rating.fromJson(json['rating'] ?? {}), // Default to empty map if null
      network: Network.fromJson(json['network'] ?? {}), // Default to empty map if null
      externals: Externals.fromJson(json['externals'] ?? {}), // Default to empty map if null
      image: ShowImage.fromJson(json['image'] ?? {}), // Default to empty map if null
      summary: json['summary'] ?? '', // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'type': type,
      'language': language,
      'genres': genres,
      'status': status,
      'runtime': runtime,
      'averageRuntime': averageRuntime,
      'premiered': premiered,
      'ended': ended,
      'officialSite': officialSite,
      'schedule': schedule.toJson(),
      'rating': rating.toJson(),
      'network': network.toJson(),
      'externals': externals.toJson(),
      'image': image.toJson(),
      'summary': summary,
    };
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
      time: json['time'] ?? '', // Default to empty string if null
      days: List<String>.from(json['days'] ?? []), // Default to empty list if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'days': days,
    };
  }
}

class Rating {
  final double average;

  Rating({required this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average'] ?? 0.0, // Default to 0.0 if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average': average,
    };
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
      id: json['id'] ?? 0, // Default to 0 if null
      name: json['name'] ?? '', // Default to empty string if null
      country: Country.fromJson(json['country'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country.toJson(),
    };
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
      name: json['name'] ?? '', // Default to empty string if null
      code: json['code'] ?? '', // Default to empty string if null
      timezone: json['timezone'] ?? '', // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'timezone': timezone,
    };
  }
}

class Externals {
  final String? imdb;

  Externals({
    this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      imdb: json['imdb'], // Allow null value for imdb
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imdb': imdb,
    };
  }
}

class ShowImage {
  final String medium;
  final String original;

  ShowImage({
    required this.medium,
    required this.original,
  });

  factory ShowImage.fromJson(Map<String, dynamic> json) {
    return ShowImage(
      medium: json['medium'] ?? '', // Default to empty string if null
      original: json['original'] ?? '', // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medium': medium,
      'original': original,
    };
  }
}

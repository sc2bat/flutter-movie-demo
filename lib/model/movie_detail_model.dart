// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModelDetail {
  bool adult;
  String backdropPath;
  BelongsToCollection belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  MovieModelDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieModelDetail copyWith({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieModelDetail(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection.toMap(),
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies.map((x) => x.toMap()).toList(),
      'productionCountries': productionCountries.map((x) => x.toMap()).toList(),
      'releaseDate': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieModelDetail.fromMap(Map<String, dynamic> map) {
    return MovieModelDetail(
      adult: map['adult'] as bool,
      backdropPath: map['backdropPath'] as String,
      belongsToCollection: BelongsToCollection.fromMap(
          map['belongsToCollection'] as Map<String, dynamic>),
      budget: map['budget'] as int,
      genres: List<Genre>.from(
        (map['genres'] as List<int>).map<Genre>(
          (x) => Genre.fromMap(x as Map<String, dynamic>),
        ),
      ),
      homepage: map['homepage'] as String,
      id: map['id'] as int,
      imdbId: map['imdbId'] as String,
      originalLanguage: map['originalLanguage'] as String,
      originalTitle: map['originalTitle'] as String,
      overview: map['overview'] as String,
      popularity: map['popularity'] as double,
      posterPath: map['posterPath'] as String,
      productionCompanies: List<ProductionCompany>.from(
        (map['productionCompanies'] as List<int>).map<ProductionCompany>(
          (x) => ProductionCompany.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productionCountries: List<ProductionCountry>.from(
        (map['productionCountries'] as List<int>).map<ProductionCountry>(
          (x) => ProductionCountry.fromMap(x as Map<String, dynamic>),
        ),
      ),
      releaseDate: map['releaseDate'] as String,
      revenue: map['revenue'] as int,
      runtime: map['runtime'] as int,
      spokenLanguages: List<SpokenLanguage>.from(
        (map['spokenLanguages'] as List<int>).map<SpokenLanguage>(
          (x) => SpokenLanguage.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] as String,
      tagline: map['tagline'] as String,
      title: map['title'] as String,
      video: map['video'] as bool,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModelDetail.fromJson(String source) =>
      MovieModelDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(covariant MovieModelDetail other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.belongsToCollection == belongsToCollection &&
        other.budget == budget &&
        listEquals(other.genres, genres) &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdbId == imdbId &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.productionCountries, productionCountries) &&
        other.releaseDate == releaseDate &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        belongsToCollection.hashCode ^
        budget.hashCode ^
        genres.hashCode ^
        homepage.hashCode ^
        id.hashCode ^
        imdbId.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        productionCompanies.hashCode ^
        productionCountries.hashCode ^
        releaseDate.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        spokenLanguages.hashCode ^
        status.hashCode ^
        tagline.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    return SpokenLanguage(
      englishName: englishName ?? this.englishName,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'englishName': englishName,
      'iso6391': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      englishName: map['englishName'] as String,
      iso6391: map['iso6391'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) =>
      SpokenLanguage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';

  @override
  bool operator ==(covariant SpokenLanguage other) {
    if (identical(this, other)) return true;

    return other.englishName == englishName &&
        other.iso6391 == iso6391 &&
        other.name == name;
  }

  @override
  int get hashCode => englishName.hashCode ^ iso6391.hashCode ^ name.hashCode;
}

class ProductionCountry {
  String iso31661;
  String name;
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountry(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso31661: map['iso31661'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromJson(String source) =>
      ProductionCountry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductionCountry(iso31661: $iso31661, name: $name)';

  @override
  bool operator ==(covariant ProductionCountry other) {
    if (identical(this, other)) return true;

    return other.iso31661 == iso31661 && other.name == name;
  }

  @override
  int get hashCode => iso31661.hashCode ^ name.hashCode;
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompany(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory ProductionCompany.fromMap(Map<String, dynamic> map) {
    return ProductionCompany(
      id: map['id'] as int,
      logoPath: map['logoPath'] as String,
      name: map['name'] as String,
      originCountry: map['originCountry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromJson(String source) =>
      ProductionCompany.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(covariant ProductionCompany other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.logoPath == logoPath &&
        other.name == name &&
        other.originCountry == originCountry;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        logoPath.hashCode ^
        name.hashCode ^
        originCountry.hashCode;
  }
}

class Genre {
  int id;
  String name;
  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) =>
      Genre.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Genre(id: $id, name: $name)';

  @override
  bool operator ==(covariant Genre other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  BelongsToCollection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return BelongsToCollection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: map['id'] as int,
      name: map['name'] as String,
      posterPath: map['posterPath'] as String,
      backdropPath: map['backdropPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
  }

  @override
  bool operator ==(covariant BelongsToCollection other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode;
  }
}

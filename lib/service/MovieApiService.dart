import 'dart:convert';

import 'package:my_movie_demo_app/model/movie_detail_model.dart';
import 'package:my_movie_demo_app/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_movie_demo_app/util/logger.dart';

enum MovieKind {
  popular,
  nowPlaying,
  comingSoon,
}

class MovieApiService {
  static String baseURL = 'https://movies-api.nomadcoders.workers.dev/';

  static Future<List<MovieModel>> getMovieApi(MovieKind movieKind) async {
    List<MovieModel> movieInstances = [];
    String kind = getMovieKind(movieKind);

    final response = await http.get(Uri.parse('$baseURL$kind'));
    logger.info('qwerasdf baseURL/kind $baseURL $kind');
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> moviesJson = jsonData['results'];
      movieInstances = moviesJson.map((e) => MovieModel.fromMap(e)).toList();
    }

    if (movieKind == MovieKind.popular) {
      movieInstances.sort((a, b) => (a.popularity).compareTo(b.popularity));
    }
    if (movieKind == MovieKind.comingSoon) {
      movieInstances.sort((a, b) => (a.releaseDate).compareTo(b.releaseDate));
    }

    return movieInstances;
  }

  static Future<MovieDetailModel> getMovieDetailApi(int id) async {
    logger.info('qwerasdf getMovieDetailApi baseURL $baseURL movie?$id');

    final response = await http.get(Uri.parse('${baseURL}movie?id=$id'));

    // logger.info('qwerasdf response.statusCode ${response.statusCode}');
    if (response.statusCode == 200) {
      // final moviesJson = jsonDecode(response.body);
      // return MovieDetailModel.fromJson(moviesJson);
      return MovieDetailModel.fromJson(response.body);
    }

    throw Error();
  }

  static String getMovieKind(MovieKind movieKind) {
    String kind = '';
    switch (movieKind) {
      case MovieKind.popular:
        kind = 'popular';
        break;
      case MovieKind.nowPlaying:
        kind = 'now-playing';
        break;
      case MovieKind.comingSoon:
        kind = 'coming-soon';
        break;
      default:
        kind = '';
        break;
    }
    return kind;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_movie_demo_app/model/movie_detail_model.dart';
import 'package:my_movie_demo_app/model/movie_model.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:http/http.dart' as http;

final logger = SimpleLogger();

enum MovieKind {
  popular,
  nowPlaying,
  comingSoon,
}

class MovieApiService {
  static String baseURL = 'https://movies-api.nomadcoders.workers.dev';

  static Future<List<MovieModel>> getMovieApi(MovieKind movieKind) async {
    List<MovieModel> movieInstances = [];
    String kind = getMovieKind(movieKind);

    final response = await http.get(Uri.parse('$baseURL/$kind'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> moviesJson = jsonData['results'];
      movieInstances = moviesJson.map((e) => MovieModel.fromMap(e)).toList();
    }

    return movieInstances;
  }

  static Future<List<MovieDetailModel>> getMovieDetailApi(int id) async {
    List<MovieDetailModel> movieDetailInstances = [];

    final response = await http.get(Uri.parse('$baseURL/movie?$id'));

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = jsonDecode(response.body);
      movieDetailInstances =
          moviesJson.map((e) => MovieDetailModel.fromJson(e)).toList();
    }

    return movieDetailInstances;
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

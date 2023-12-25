import 'package:flutter/material.dart';
import 'package:my_movie_demo_app/screen/movie_detail_screen.dart';
import 'package:my_movie_demo_app/util/logger.dart';

class MovieWithTitleWidget extends StatelessWidget {
  final bool adult;
  final String backdropPath;
  final List<dynamic> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieWithTitleWidget({
    super.key,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    logger.info('qwerasdf https://image.tmdb.org/t/p/w500/$id');
    logger.info('qwerasdf https://image.tmdb.org/t/p/w500/$posterPath');
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 200,
              height: 250,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/$posterPath',
                      fit: BoxFit.cover,
                      width: 180.0,
                      height: 180.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    width: 180.0,
                    child: Text(
                      originalTitle,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

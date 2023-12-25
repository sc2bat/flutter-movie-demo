import 'package:flutter/material.dart';
import 'package:my_movie_demo_app/model/movie_detail_model.dart';
import 'package:my_movie_demo_app/service/MovieApiService.dart';
import 'package:my_movie_demo_app/util/logger.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;

  const MovieDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> movieDetails;

  @override
  void initState() {
    super.initState();
    movieDetails = MovieApiService.getMovieDetailApi(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Back to list'),
        ),
        body: FutureBuilder(
          future: movieDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return buildMovieDetails(snapshot.data!);
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ));
  }

  Widget buildMovieDetails(MovieDetailModel movieDetailModel) {
    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500/${movieDetailModel.posterPath}',
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetailModel.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                movieDetailModel.overview,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Release Date: ${movieDetailModel.releaseDate}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

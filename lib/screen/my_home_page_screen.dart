import 'package:flutter/material.dart';
import 'package:my_movie_demo_app/model/movie_model.dart';
import 'package:my_movie_demo_app/service/MovieApiService.dart';

import '../widget/movie_model_widget.dart';

class MyHomePageScreen extends StatelessWidget {
  MyHomePageScreen({super.key, required this.title});

  final String title;

  final Future<List<MovieModel>> movies = MovieApiService.getMovieApi();

  @override
  Widget build(BuildContext context) {
    final popularMovies = [];
    final nowInCinemasMovies = [];
    final comingSoonMovies = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          const Text(
            'Popular Movies',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Expanded(
                      child: makeMovieList(snapshot),
                    ),
                  ],
                );
              } else {
                // return const Text("Loading...");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const Text(
            'Now in Cinemas',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Coming soon',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var movie = snapshot.data![index];
          return MovieModelWidget(
            adult: movie.adult,
            backdropPath: movie.backdropPath,
            genreIds: movie.genreIds,
            id: movie.id,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            popularity: movie.popularity,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 8.0,
            ),
        itemCount: snapshot.data!.length);
  }
}

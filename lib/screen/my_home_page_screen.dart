import 'package:flutter/material.dart';
import 'package:my_movie_demo_app/model/movie_model.dart';
import 'package:my_movie_demo_app/service/MovieApiService.dart';
import 'package:my_movie_demo_app/util/logger.dart';
import 'package:my_movie_demo_app/widget/movie_image_only_widget.dart';

import '../widget/movie_with_title_widget.dart';

class MyHomePageScreen extends StatelessWidget {
  MyHomePageScreen({super.key, required this.title});

  final String title;

  final Future<List<MovieModel>> popularMovies =
      MovieApiService.getMovieApi(MovieKind.popular);
  final Future<List<MovieModel>> nowInCinemasMovies =
      MovieApiService.getMovieApi(MovieKind.nowPlaying);
  final Future<List<MovieModel>> comingSoonMovies =
      MovieApiService.getMovieApi(MovieKind.comingSoon);

  @override
  Widget build(BuildContext context) {
    logger.info('qwerasdf homepage');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Movies',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  logger.info('qwerasdf FutureBuilder');
                  if (snapshot.hasData) {
                    logger.info('qwerasdf snapshot.hasData');
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: makeMovieList(
                            snapshot,
                          ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Now in Cinemas',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 290.0,
              child: FutureBuilder(
                future: nowInCinemasMovies,
                builder: (context, snapshot) {
                  logger.info('qwerasdf FutureBuilder now in cinemas');
                  if (snapshot.hasData) {
                    logger.info('qwerasdf  now in cinemas snapshot.hasData');
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: makeMovieWithTitleList(
                            snapshot,
                          ),
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
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Coming soon',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 290.0,
              child: FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  logger.info('qwerasdf FutureBuilder now in cinemas');
                  if (snapshot.hasData) {
                    logger.info('qwerasdf comingsoon snapshot.hasData');
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: makeMovieWithTitleList(
                            snapshot,
                          ),
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
            ),
          ],
        ),
      ),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        logger.info('qwerasdf movie.id => ${movie.id}');
        return MovieImageOnlyWidget(
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
      itemCount: snapshot.data!.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 16.0,
      ),
    );
  }

  makeMovieWithTitleList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        logger.info('qwerasdf movie.id => ${movie.id}');
        return MovieWithTitleWidget(
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
      itemCount: snapshot.data!.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 8.0,
      ),
    );
  }
}

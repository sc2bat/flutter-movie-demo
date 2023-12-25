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
      body: FutureBuilder(
        future: movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            logger.info('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return buildMovieDetails(snapshot.data!);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget buildMovieDetails(MovieDetailModel movieDetailModel) {
    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500/${movieDetailModel.posterPath}',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.black54,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Text(
                        movieDetailModel.title,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: index < movieDetailModel.voteAverage / 2
                                  ? Colors.yellow
                                  : Colors.grey,
                            ),
                          ),
                          /*
                          [
                            // for (var genre in movieDetailModel.genres)
                            Icon(
                              Icons.star_border,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                            Icon(Icons.star_half),
                          ],
                           */
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${movieDetailModel.runtime ~/ 60}h ${movieDetailModel.runtime % 60}min',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 2.0,
                              height: 12.0,
                              color: Colors.white70,
                            ),
                          ),
                          for (var genre in movieDetailModel.genres)
                            Text(
                              '${genre.name}${genre != movieDetailModel.genres.last ? ', ' : ''}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                        ],
                        // movieDetailModel.genres
                        //     .map((e) => Text(e.name ?? 'none'),)
                        //     .toList(),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      const Text(
                        'Storyline',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          'story asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdfstory asdf'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 2000,
                color: Colors.black54,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Back to list',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 80,
          right: 80,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Buy ticket',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final popularMovies = [];
    final nowInCinemasMovies = [];
    final comingSoonMovies = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: popularMovies.length,
          //     itemBuilder: (context, index) {
          //       Image.network(popularMovies[index].imageUrl);
          //     },
          //   ),
          // ),
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
}

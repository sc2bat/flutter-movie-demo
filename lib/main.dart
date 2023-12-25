import 'package:flutter/material.dart';

import 'screen/my_home_page_screen.dart';
import 'util/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.info('qwerasdf start');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePageScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:components/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      home: HomePageTemp(),
    );
  }
}

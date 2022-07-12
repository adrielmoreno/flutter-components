import 'package:flutter/material.dart';

import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),
      // route undefined
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const AlertPage());
      },
    );
  }
}

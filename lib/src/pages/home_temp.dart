import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cindo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components Temp'),
      ),
      body: ListView(
        children: _createItems(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = <Widget>[];

    for (String option in options) {
      final tempWidget = ListTile(
        title: Text(option),
      );

      // .. cascade operator
      list
        ..add(tempWidget)
        ..add(const Divider(
          color: Color.fromARGB(73, 222, 15, 15),
        ));
    }

    return list;
  }
}

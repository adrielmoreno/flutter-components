import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return ListView(
      children: _listItems(),
    );
  }

  List<Widget> _listItems() {
    return [
      const ListTile(title: Text('Hola Mundo')),
      const Divider(),
      const ListTile(title: Text('Hola Mundo')),
      const Divider(),
      const ListTile(title: Text('Hola Mundo')),
      const Divider(),
    ];
  }
}

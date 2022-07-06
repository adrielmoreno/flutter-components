import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components Temp'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('ListTile Tile'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Tile'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Tile'),
          ),
          Divider(),
        ],
      ),
    );
  }
}

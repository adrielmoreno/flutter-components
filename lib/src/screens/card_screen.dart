import 'package:components/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // padding: const EdgeInsets.all(10),
        children: const [
          CustomCardTop(),
          SizedBox(height: 20.0),
          CustomCardCenter(
              imageUrl:
                  'https://img.freepik.com/premium-vector/meadows-landscape-with-mountains-hill_104785-943.jpg?w=2000'),
          SizedBox(height: 20.0),
          CustomCardCenter(
              imageUrl: 'https://wallpaperaccess.com/full/170249.jpg'),
          SizedBox(height: 20.0),
          CustomCardCenter(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Landscape_Arnisee-region.JPG/1200px-Landscape_Arnisee-region.JPG'),
        ],
      ),
    );
  }
}

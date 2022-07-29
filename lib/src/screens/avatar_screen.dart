import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar screen'),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Robert_Downey%2C_Jr._2012.jpg/245px-Robert_Downey%2C_Jr._2012.jpg'),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 208, 28, 28),
              child: Text('TS'),
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://www.cinemascomics.com/wp-content/uploads/2020/04/iron-man-endgame-tony-stark.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(seconds: 2),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

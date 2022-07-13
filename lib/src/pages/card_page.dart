import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Primera tarjeta'),
            subtitle: Text(
                'sjflajslfjlasjflalsdflañsdfjklñadsjdfñasjkdflñajsdflñkjaldsfjalsfjklañsdfj'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: const Text('Cancelar')),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
        child: Column(
      children: <Widget>[
        const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://img.freepik.com/premium-vector/meadows-landscape-with-mountains-hill_104785-943.jpg?w=2000'),
          fadeOutDuration: Duration(seconds: 2),
          height: 240.0,
          fit: BoxFit.cover,
        ),
        Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Imagen de muestra'))
      ],
    ));
  }
}

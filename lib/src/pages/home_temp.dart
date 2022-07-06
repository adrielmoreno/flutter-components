import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final people = ['Adriel', 'Dylan', 'Dwayne', 'Maria', 'Yoma'];

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
    return people.map((opt) {
      return Column(
        children: [
          ListTile(
            leading: const Icon(Icons.perm_contact_cal_sharp),
            title: Text(opt),
            subtitle: const Text('Info de prueba'),
            trailing: const Icon(Icons.navigate_next_sharp),
            onTap: () {}, // da por defecto el efecto de clic
          ),
          const Divider(
            color: Color.fromARGB(73, 222, 15, 15),
          )
        ],
      );
    }).toList();
  }
}

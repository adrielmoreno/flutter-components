import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre',
          label: const Text('Usuario:'),
          helperText: 'Sólo el nombre de usuario',
          suffix: const Icon(
            Icons.accessibility,
            color: Colors.blue,
          ),
          icon: const Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es $_nombre'),
    );
  }
}

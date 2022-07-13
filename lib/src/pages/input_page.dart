import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  final TextEditingController _inputDateController = TextEditingController();
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
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
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
      title: Text('Nombre $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          hintText: 'Email',
          label: Text('Email:'),
          suffix: Icon(
            Icons.alternate_email,
            color: Colors.blue,
          ),
          icon: Icon(Icons.mark_email_unread_outlined)),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _crearPassword() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          hintText: 'Password',
          label: Text('Password:'),
          suffix: Icon(
            Icons.password,
            color: Colors.blue,
          ),
          icon: Icon(Icons.lock_outline)),
      onChanged: (value) {},
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          hintText: 'Fecha de nacimiento',
          label: Text('Fecha de nacimiento:'),
          suffix: Icon(
            Icons.date_range,
            color: Colors.blue,
          ),
          icon: Icon(Icons.calendar_month)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2023),
        locale: const Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputDateController.text = _fecha;
      });
    }
  }
}

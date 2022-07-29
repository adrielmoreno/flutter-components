import 'package:components/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String _fecha = '';

  final List<String> roles = [
    'Admin',
    'Team Lead',
    'Senior Developer',
    'Junior Developer'
  ];
  final TextEditingController _inputDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': '',
      'last_name': '',
      'email': '',
      'password': '',
      'role': ''
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              CustomInputField(
                labelText: 'Nombre',
                hintText: 'Nombre del usuario',
                formProperty: 'first_name',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Apellido',
                hintText: 'Apellido del usuario',
                formProperty: 'last_name',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Correo',
                hintText: 'Correo del usuario',
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icons.alternate_email,
                icon: Icons.mark_email_unread_outlined,
                formProperty: 'email',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                obscureText: true,
                labelText: 'Password',
                hintText: 'Password del usuario',
                suffixIcon: Icons.lock_open,
                icon: Icons.lock_outline,
                formProperty: 'password',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField(
                  value: 'Admin',
                  items: getOptionsDropdwon(),
                  onChanged: (opt) {
                    formValues['role'] = opt.toString();
                  }),
              const SizedBox(height: 30),
              _crearFecha(context),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // quitar el teclado
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!myFormKey.currentState!.validate()) {
                    // ignore: avoid_print
                    print('Formulario no válido');
                    return;
                  }
                  // valores
                  // ignore: avoid_print
                  print(formValues);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Guardar')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: const InputDecoration(
          hintText: 'Fecha de nacimiento',
          label: Text('Fecha de nacimiento:'),
          suffix: Icon(Icons.date_range),
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

  List<DropdownMenuItem<String>> getOptionsDropdwon() {
    List<DropdownMenuItem<String>> lista = [];

    for (var role in roles) {
      lista.add(DropdownMenuItem(
        value: role,
        child: Text(role),
      ));
    }
    return lista;
  }
}

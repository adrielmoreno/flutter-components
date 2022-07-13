import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert page'),
      ),
      body: Center(
          child: TextButton(
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blue,
            shape: const StadiumBorder()),
        child: const Text('Mostar Alerta'),
        onPressed: () => _showAlert(context),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Contenido de prueba de la Caja'),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok')),
            ],
          );
        });
  }
}

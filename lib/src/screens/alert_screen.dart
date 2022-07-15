import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert screen'),
      ),
      body: Center(
          child: ElevatedButton(
              child: const Text('Mostar Alerta'),
              onPressed: () => _showAlert(context))),
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
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Titulo'),
            content: Column(
              // Ancho dependerá de sus hijos
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Contenido de prueba de la Caja'),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
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

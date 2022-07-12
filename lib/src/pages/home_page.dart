import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      // initialData información por defecto si no se resuelve el future.
      // initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];

    data?.forEach((opt) {
      final widgetTemp = ListTile(
        leading: getIcon(opt['icon']),
        title: Text(opt['texto']),
        trailing: const Icon(Icons.arrow_circle_right_outlined,
            color: Color(0xFF6CB5F1)),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      options
        ..add(widgetTemp)
        ..add(const Divider());
    });

    return options;
  }
}

import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';

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
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? data) {
    final List<Widget> options = [];

    data?.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: const Icon(Icons.account_box,
            color: Color.fromRGBO(108, 181, 241, 1)),
        trailing: const Icon(Icons.arrow_circle_right_outlined,
            color: Color(0xFF6CB5F1)),
        onTap: () {},
      );

      options
        ..add(widgetTemp)
        ..add(const Divider());
    });

    return options;
  }
}

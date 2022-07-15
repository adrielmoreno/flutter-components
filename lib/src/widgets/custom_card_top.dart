import 'package:components/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardTop extends StatelessWidget {
  const CustomCardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: AppTheme.primary,
            ),
            title: Text('Primera tarjeta'),
            subtitle: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {}, child: const Text('Cancelar')),
                TextButton(onPressed: () {}, child: const Text('Ok')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

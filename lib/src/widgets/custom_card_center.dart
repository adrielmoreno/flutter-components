import 'package:components/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardCenter extends StatelessWidget {
  final String imageUrl;
  const CustomCardCenter({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Column(
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(imageUrl),
              fadeOutDuration: const Duration(seconds: 2),
              fit: BoxFit.cover,
              height: 240.0,
            ),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.all(10.0),
                child: const Text('Imagen de muestra'))
          ],
        ));
  }
}

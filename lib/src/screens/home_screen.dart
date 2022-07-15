import 'package:components/src/routes/app_routes.dart';
import 'package:components/src/theme/app_theme.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Icon(menuOptions[index].icon, color: AppTheme.primary),
                title: Text(menuOptions[index].name),
                trailing: const Icon(Icons.arrow_circle_right_outlined,
                    color: AppTheme.primary),
                onTap: () {
                  Navigator.pushNamed(context, menuOptions[index].route);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOptions.length),
    );
  }
}

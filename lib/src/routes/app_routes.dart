import 'package:components/src/models/menu_option.dart';
import 'package:components/src/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: "home",
        icon: Icons.add_alert,
        name: "Home",
        screen: const HomeScreen()),
    MenuOption(
        route: "alert",
        icon: Icons.add_alert,
        name: "Alertas",
        screen: const AlertScreen()),
    MenuOption(
        route: "avatar",
        icon: Icons.accessibility,
        name: "Avatars",
        screen: const AvatarScreen()),
    MenuOption(
        route: "card",
        icon: Icons.folder_open,
        name: "Cards - Tarjetas",
        screen: const CardScreen()),
    MenuOption(
        route: "animatedContainer",
        icon: Icons.donut_large,
        name: "Animated Container",
        screen: const AnimatedContainerScreen()),
    MenuOption(
        route: "inputs",
        icon: Icons.input,
        name: "inputs",
        screen: const InputScreen()),
    MenuOption(
        route: "slider",
        icon: Icons.list,
        name: "Sliders - Checks",
        screen: const SliderScreen()),
    MenuOption(
        route: "list",
        icon: Icons.tune,
        name: "Listas y Scroll",
        screen: const ListScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'avatar': (BuildContext context) => const AvatarScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  //   'animatedContainer': (BuildContext context) =>
  //       const AnimatedContainerScreen(),
  //   'inputs': (BuildContext context) => const InputScreen(),
  //   'slider': (BuildContext context) => const SliderScreen(),
  //   'list': (BuildContext context) => const ListScreen(),
  // };

  static Route<dynamic> generateDefaultRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) => const AlertScreen());
  }
}

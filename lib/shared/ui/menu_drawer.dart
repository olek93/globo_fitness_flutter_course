import "package:flutter/material.dart";
import "package:globo_fitness/screens/bmi_screen.dart";
import "package:globo_fitness/screens/intro_screen.dart";

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuItemNames = [
      "Home",
      "BMI Calculator",
      "Weather",
      "Training"
    ];
    List<Widget> menuItems = [
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          "Globo Fitness",
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      )
    ];

    for (String element in menuItemNames) {
      Widget screen = Container();
      menuItems.add(
        ListTile(
          title: Text(
            element,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: () {
            switch (element) {
              case "Home":
                screen = const IntroScreen();
                break;
              case "BMI Calculator":
                screen = const BmiScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => screen)
            );
          },
        ),
      );
    }
    return menuItems;
  }
}

import "package:flutter/material.dart";
import "package:globo_fitness/shared/singleton_tools/route_observer.dart";

class BottomPicker extends StatelessWidget {
  const BottomPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) => handleTap(index, context),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight_outlined), label: "BMI"),
        ]);
  }

  void handleTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        _setRouteWhenNotSetAndClearStack(context, "/");
        break;
      case 1:
        _setRouteWhenNotSetAndInsertIntroScreen(context, "/bmi");
        break;
    }
  }

  void _setRouteWhenNotSetAndClearStack(BuildContext context, String route) {
    String? currentRoute = GloboRouteObserver().currentRoute;
    if (route != currentRoute) {
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, route);
    }
  }

  void _setRouteWhenNotSetAndInsertIntroScreen(BuildContext context, String route) {
    String? currentRoute = GloboRouteObserver().currentRoute;
    if (route != currentRoute) {
      Navigator.popAndPushNamed(context, "/");
      Navigator.pushNamed(context, route);
    }
  }

}

import 'package:flutter/material.dart';
// import 'package:globo_fitness/shared/ui/menu_drawer.dart';
import 'package:globo_fitness/shared/ui/bottom_picker.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Globo Fitness"),
        ),
        // drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomPicker(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgr.png'),
                  fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Center(
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white70,
                    ),
                    child: const Text(
                      "Commit to be fit, dare to be great\n with Globo Fitness",
                      style: TextStyle(fontSize: 20, shadows: <Shadow>[
                        Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            color: Colors.grey)
                      ]),
                      textAlign: TextAlign.center,
                    ))),
          ),
        ));
  }
}

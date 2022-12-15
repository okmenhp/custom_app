import 'package:flutter/material.dart';

class StatefulTutorial extends StatefulWidget {
  const StatefulTutorial({super.key});

  @override
  State<StatefulTutorial> createState() => _StatefulTutorialState();
}

class _StatefulTutorialState extends State<StatefulTutorial> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$number')],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

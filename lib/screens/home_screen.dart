import 'package:custom_app/screens/listofdata_screen.dart';
import 'package:custom_app/screens/onboarding_screen.dart';
import 'package:custom_app/screens/stateful_screen.dart';
import 'package:custom_app/widgets/tutorial_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: size.height * .2,
            width: size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: AssetImage("assets/images/bg_flutter.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TutorialCard(
                title: "Onboarding Screen",
                press: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const OnBoardingSreen())),
              ),
              TutorialCard(
                title: "Statleful",
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StatefulTutorial())),
              ),
              TutorialCard(
                title: "List of Datas",
                press: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ListOfDatas())),
              ),
            ],
          )
        ],
      ),
    );
  }
}

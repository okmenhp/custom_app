import 'package:custom_app/models/onboarding_data.dart';
import 'package:custom_app/screens/home_screen.dart';
import 'package:custom_app/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingSreen extends StatefulWidget {
  const OnBoardingSreen({super.key});

  @override
  State<OnBoardingSreen> createState() => _OnBoardingSreenState();
}

class _OnBoardingSreenState extends State<OnBoardingSreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingDatas.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    // color: Colors.red,
                    height: getProportionateScreenHeight(295),
                    width: getProportionateScreenWidth(325),
                    child: Image.asset(onboardingDatas[index].image),
                  ),
                  Column(
                    children: [
                      Text(
                        onboardingDatas[index].title,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(24),
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onboardingDatas[index].descript,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: getProportionateScreenWidth(12),
                                ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // const SizedBox(height: 10),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // const Text("Skip"),
                      Row(
                        children: List.generate(
                          onboardingDatas.length,
                          (index) => dotIndicator(index),
                        ),
                      ),
                      // const Text("Next"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 77,
                              width: 77,
                              decoration: const BoxDecoration(
                                color: Color(0xffE4E4E4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: CircularProgressIndicator(
                                  valueColor: const AlwaysStoppedAnimation(
                                      Color(0xff152272)),
                                  value: (currentPage + 1) /
                                      (onboardingDatas.length)),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (currentPage == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomeScreen()));
                                }
                                nextFunction();
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff152272),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  AnimatedContainer dotIndicator(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: currentPage == index ? 24 : 12,
      decoration: BoxDecoration(
          color: currentPage == index
              ? const Color(0xff463A88)
              : const Color(0xffB4B0CF),
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}

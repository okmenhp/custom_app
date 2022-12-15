class OnBoarding {
  final String title;
  final String image;
  final String descript;
  OnBoarding({
    required this.title,
    required this.image,
    required this.descript,
  });
}

List<OnBoarding> onboardingDatas = [
  OnBoarding(
      title: "Quick & Easy Payments",
      image: "assets/images/img_onboarding_step1.png",
      descript:
          "Get your business by accepting card \npayments with the new card reader"),
  OnBoarding(
      title: "Smart Point of sale",
      image: "assets/images/img_onboarding_step2.png",
      descript:
          "Complete point of sale system tailored \nto your business needs."),
  OnBoarding(
      title: "Instant notifications",
      image: "assets/images/img_onboarding_step3.png",
      descript:
          "Ins tant notifications let you quickly see \nnew purchases and messages")
];

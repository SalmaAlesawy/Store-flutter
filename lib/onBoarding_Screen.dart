import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_Screen.dart';



class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Choose Your Product',
        body: "",
        image: Center(
          child: Image.asset("assets/images/Choose product.jpg",
              width: double.infinity),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: 'Make an Order',
        body: "",
        image: Center(
          child: Image.asset("assets/images/Buy.jpg", width: double.infinity),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: 'Easy& Fast Delivery',
        body: "",
        image: Center(
          child: Image.asset(
            "assets/images/Delivery.jpg",
            width: double.infinity,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding Screen"),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeColor: Colors.red,
            activeSize: Size.square(15)),
        showDoneButton: true,
        done: const Text(
          "Done",
          style: TextStyle(fontSize: 20),
        ),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(fontSize: 20),
        ),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        onDone: () => onDone(context),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
  }
}

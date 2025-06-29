import "package:flutter/material.dart";

import "package:mental_health_app/features/onboarding/screens/onboarding_screen.dart";

void main() {
  runApp(MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soul Solusions",
      home: OnboardingScreen()
    );
  }
}
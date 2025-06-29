import "package:flutter/material.dart";

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF1E1E1E),
      body: Column(
        children: [
          // Top Black section
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/black_bg.png"),
                fit: BoxFit.cover
              )
            ),
            padding: const EdgeInsets.only(
              top: 120,
              bottom: 120
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20
              ),
              child: Text(
                "Welcome to \nSoul Solutions",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          // Bottom white section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF6F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/doctor_illustration.png"),
                  const SizedBox(height:30),
                  const Text(
                    "Get support from thousands of experts",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Get start button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 170, 203, 124),
                      minimumSize: const Size(350, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Get Start",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
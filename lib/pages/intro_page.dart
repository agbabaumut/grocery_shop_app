import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          //logo
          MainLogoWidget(),

          // text

          MainHeaderWidget(),
          // subtitle

          MainSubheaderWidget(),
          Spacer(),

          StartButtonWidget(),
          Spacer(),
        ],
      ),
    );
  }
}

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(24),
        child: const Text(
          "Başla",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MainSubheaderWidget extends StatelessWidget {
  const MainSubheaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Hergün taze ürünler",
        style: TextStyle(fontWeight: FontWeight.w400, color: Colors.green),
      ),
    );
  }
}

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Ürünleri kapınıza kadar teslim ediyoruz",
        textAlign: TextAlign.center,
        style: GoogleFonts.notoSerif(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MainLogoWidget extends StatelessWidget {
  const MainLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, bottom: 40, left: 80, right: 80),
      child: Image.asset("lib/images/avocado.png"),
    );
  }
}

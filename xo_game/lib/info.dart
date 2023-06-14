import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class INfoPage extends StatelessWidget {
  const INfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff006eb6),
        title: const Text(
          'IEEE Flutter Team',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('ieee.png'),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ElevatedButton.icon(
                onPressed: () =>
                    launch('https://www.facebook.com/IEEEBenhaUnivSB'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color(0xff006eb6),
                ),
                icon: const Icon(
                  Icons.facebook,
                  size: 30,
                ),
                label: const Text(
                  'IEEE Shoubra',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            ElevatedButton.icon(
                onPressed: () => launch('https://www.facebook.com/IEEE.org'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color(0xff006eb6),
                ),
                icon: const Icon(
                  Icons.facebook,
                  size: 30,
                ),
                label: const Text(
                  'IEEE Community',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            ElevatedButton.icon(
                onPressed: () =>
                    launch('https://www.facebook.com/Mohammed.Mamdouh.432'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color(0xff006eb6),
                ),
                icon: const Icon(
                  Icons.facebook,
                  size: 30,
                ),
                label: const Text(
                  'Flutter Head Team',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            ElevatedButton.icon(
                onPressed: () => launch(
                    'https://www.facebook.com/profile.php?id=100003470728228'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  backgroundColor: const Color(0xff006eb6),
                ),
                icon: const Icon(
                  Icons.facebook,
                  size: 30,
                ),
                label: const Text(
                  'Flutter Vice Head Team',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
            )
          ],
        ),
      ),
    );
  }
}

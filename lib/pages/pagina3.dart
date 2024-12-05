import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4), // espaçamento
            const Text(
              'Gostaria de informar seu CPF?',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF66BB6A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
                    textStyle: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/forth');
                  },
                  child: const Text('Sim'),
                ),
                const SizedBox(width: 100),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFF9A825),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
                    textStyle: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/fifth');
                  },
                  child: const Text('Não'),
                ),
              ],
            ),
            const Spacer(flex: 2), // espaçamento
          ],
        ),
      ),
    );
  }
}

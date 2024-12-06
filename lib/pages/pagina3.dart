import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';

class Pagina3 extends StatelessWidget {
  final FeedbackData feedbackData;

  const Pagina3({required this.feedbackData, super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200), // espaçamento
              const Text(
                'Gostaria de informar seu CPF?',
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100), // espaçamento entre o texto e os botões
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
                      Navigator.pushNamed(context, '/forth', arguments: feedbackData);
                    },
                    child: const Text('Sim'),
                  ),
                  const SizedBox(width: 100), // espaçamento horizontal entre os botões
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
                      Navigator.pushNamed(context, '/sixth', arguments: feedbackData);
                    },
                    child: const Text('Não'),
                  ),
                ],
              ),
              const SizedBox(height: 0), // espaçamento
            ],
          ),
        ),
      ),
    );
  }
}

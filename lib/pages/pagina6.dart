// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/pages/pagina1.dart';

class Pagina6 extends StatefulWidget {
  const Pagina6({super.key});

  @override
  _Pagina6State createState() => _Pagina6State();
}

class _Pagina6State extends State<Pagina6> {
  @override
  void initState() {
    super.initState();
    // redireciona para a página inicial após alguns segundos
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Pagina1()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Obrigado!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 150,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Seus dados foram enviados com ',
                    style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'sucesso!',
                    style: TextStyle(color:Color(0xFFF9A825), fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
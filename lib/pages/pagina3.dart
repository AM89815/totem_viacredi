import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';
import 'dart:async';

class Pagina3 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina3({required this.feedbackData, super.key});

  @override
  _Pagina3State createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startInatividadeTimer();
  }

  void _startInatividadeTimer() {
    _timer = Timer(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });
  }

  void _resetInatividadeTimer() {
    _timer?.cancel();
    _startInatividadeTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _resetInatividadeTimer,
        onPanDown: (_) => _resetInatividadeTimer(),
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
                const SizedBox(
                    height: 100), // espaçamento entre o texto e os botões
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF66BB6A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 40.0),
                        textStyle: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _timer?.cancel(); // cancela o temporizador
                        Navigator.pushNamed(context, '/forth',
                            arguments: widget.feedbackData);
                      },
                      child: const Text('Sim'),
                    ),
                    const SizedBox(
                        width: 100), // espaçamento horizontal entre os botões
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFF9A825),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 40.0),
                        textStyle: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _timer?.cancel(); // cancela o temporizador
                        Navigator.pushNamed(context, '/sixth',
                            arguments: widget.feedbackData);
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
      ),
    );
  }
}

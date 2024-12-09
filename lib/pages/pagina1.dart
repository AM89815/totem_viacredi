import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';
import 'dart:async';

final List<Color> buttonColors = [
  Color(0xFF5B1F16),
  Color(0xFF942A18),
  Color(0xFFE73C22),
  Color(0xFFEC681C),
  Color(0xFFF39019),
  Color(0xFFFBBA18),
  Color(0xFFFCDA23),
  Color(0xFFCCCC5F),
  Color(0xFFCCCC5F),
  Color(0xFF69B436),
  Color(0xFF316E2E),
];

class Pagina1 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina1({required this.feedbackData, super.key});

  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  int selectNota = -1;
  Timer? _timer;

  void _startInatividadeTimer() {
    _timer = Timer(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushNamed(context, '/sixth', arguments: widget.feedbackData);
      }
    });
  }

/*
  void _startInatividadeTimer() {
    _timer = Timer(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          selectNota = -1; // Reseta a seleção dos botões
        });
      }
    });
  }
  */

  void _resetInatividadeTimer() {
    _timer?.cancel();
    _startInatividadeTimer();
  }

  void _onButtonPressed(int nota) {
    setState(() {
      selectNota = nota;
      widget.feedbackData.nota = selectNota;
    });
    _resetInatividadeTimer();
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
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 175), // espaçamento superior
              const Text(
                'Em uma escala de 0 a 10, o quanto você indicaria a\nexperiência de hoje para amigos e familiares?',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // espaçamento
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(11, (nota) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          backgroundColor: selectNota == nota
                              ? Colors.grey
                              : buttonColors[nota],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          minimumSize: const Size(125, 125),
                          maximumSize: const Size(125, 125),
                        ),
                        onPressed: () {
                          _onButtonPressed(nota);
                        },
                        child: Text(
                          '$nota',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 40), // espaçamento
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 119, 189, 1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 30.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: selectNota == -1
                    ? null
                    : () {
                        _timer?.cancel(); // cancela o temporizador
                        Navigator.pushNamed(context, '/second',
                            arguments: widget.feedbackData); // armazena a nota
                      },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

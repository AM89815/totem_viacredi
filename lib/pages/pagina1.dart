import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';

final List<Color> buttonColors = [
  Colors.red,
  Colors.red,
  Colors.orange,
  Colors.orangeAccent,
  Colors.orangeAccent,
  Colors.yellow,
  Colors.lightGreenAccent,
  Colors.lightGreenAccent,
  Colors.lightGreen,
  Colors.green,
  Colors.green,
];

class Pagina1 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina1({required this.feedbackData, super.key});

  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  int selectNota = -1;

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
              const SizedBox(height: 200), // espaçamento superior
              const Text(
                'Em uma escala de 0 a 10, o quanto você indicaria a\nexperiência de hoje para amigos e familiares?',
                style: TextStyle(
                  fontSize: 40,
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
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectNota == nota ? Colors.grey : buttonColors[nota],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(125, 125)
                        ),
                        onPressed: () {
                          setState(() {
                            selectNota = nota;
                          });
                        },
                        child: Text(
                          '$nota',
                          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 25), // espaçamento
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 119, 189, 1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                  textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: selectNota == -1
                    ? null
                    : () {
                        widget.feedbackData.nota = selectNota; // armazena a nota
                        Navigator.pushNamed(context, '/second', arguments: widget.feedbackData);
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

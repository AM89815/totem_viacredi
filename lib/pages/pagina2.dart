import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';

class Pagina2 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina2({required this.feedbackData, super.key});

  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  List<int> selectEstrelas = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: false,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'Ambiente do Posto de Atendimento',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            quantEstrelasRow(0),
            const SizedBox(height: 5), // espaçamento

            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'Atendimento dos colaboradores',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            quantEstrelasRow(1),
            const SizedBox(height: 5), // espaçamento

            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'Tempo de espera',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            quantEstrelasRow(2),
            const SizedBox(height: 25), // espaçamento

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFF9A825),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              onPressed: selectEstrelas.every((estrela) => estrela > 0)
                  ? () {
                      widget.feedbackData.estrelas = selectEstrelas; // armazena as estrelas
                      Navigator.pushNamed(context, '/third', arguments: widget.feedbackData);
                    }
                  : null,
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  // função da linha de estrelas
  Widget quantEstrelasRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (estrelaIndex) {
        return IconButton(
          icon: Image.asset(
            selectEstrelas[index] > estrelaIndex
                ? 'assets/images/images-totem/estrela_active.png'
                : 'assets/images/images-totem/starlight.png',
            width: 90,
            height: 90,
          ),
          onPressed: () {
            setState(() {
              selectEstrelas[index] = estrelaIndex + 1;
            });
          },
        );
      }),
    );
  }
}

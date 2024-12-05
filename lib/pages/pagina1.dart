// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totem/background/basepage.dart';

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
  const Pagina1({super.key});

  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  int selectNota = -1;

  Future<void> addNota(int nota) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'nota': nota,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
    }).then((value) {
      print("Dados coletados (página 1)");
    }).catchError((error) {
      print("Falha ao coletar os dados (página 1): $error");
    });
  }

  @override
  Widget build(BuildContext context) {  
    return BasePage(
      showLogo: true, // exibe a logo nesta página
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            const Text(
              'Em uma escala de 0 a 10, o quanto você indicaria a\nexperiência de hoje para amigos e familiares?',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // espaçamento
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
              children: List.generate(11, (nota) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectNota == nota ? Colors.grey : buttonColors[nota],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(100, 100),
                  ),
                  onPressed: () {
                    setState(() {
                      selectNota = nota;
                    });
                  },
                  child: Text(
                    '$nota',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40), // espaçamento
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
                  : () async {
                      await addNota(selectNota); // adiciona a nota ao Firestore
                      Navigator.pushNamed(context, '/second');
                    },
              child: const Text('Enviar'),
            ),
            const Spacer(flex: 2), // espaçamento
          ],
        ),
      ),
    );
  }
}
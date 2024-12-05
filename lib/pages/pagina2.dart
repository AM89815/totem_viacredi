// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totem/background/basepage.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  List<int> selectEstrelas = [0, 0, 0];

  Future<void> addEstrelas(List<int> estrelas) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'ambiente': estrelas[0],
      'atendimento': estrelas[1],
      'tempo_espera': estrelas[2],
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print("Dados coletados (página 2)");
    }).catchError((error) {
      print("Falha ao coletar os dados (página 2): $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              'Ambiente do Posto de Atendimento',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          quantEstrelasRow(0),
          const SizedBox(height: 20), // espaçamento

          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              'Atendimento dos colaboradores',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          quantEstrelasRow(1),
          const SizedBox(height: 20), // espaçamento

          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              'Tempo de espera',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          quantEstrelasRow(2),
          const SizedBox(height: 20), // espaçamento

          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFF9A825),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            onPressed: selectEstrelas.every((estrela) => estrela > 0)
                ? () async {
                    await addEstrelas(selectEstrelas); // manda as estrelas pro Firestore
                    Navigator.pushNamed(context, '/third');
                  }
                : null,
            child: const Text('Enviar'),
          ),
        ],
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
            width: 100,
            height: 100,
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

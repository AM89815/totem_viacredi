// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';
import 'package:totem/pages/pagina1.dart';

class Pagina6 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina6({required this.feedbackData, super.key});

  @override
  _Pagina6State createState() => _Pagina6State();
}

class _Pagina6State extends State<Pagina6> {
  @override
  void initState() {
    super.initState();
    // manda os dados pro Firestore
    _sendFeedbackData();

    // redireciona para a página inicial após alguns segundos
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pagina1(feedbackData: FeedbackData())),
      );
    });
  }

  Future<void> _sendFeedbackData() async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'nota': widget.feedbackData.nota,
      'cpf': widget.feedbackData.cpf,
      'estrelas': widget.feedbackData.estrelas,
      'comentario': widget.feedbackData.comentario,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print("Dados coletados com sucesso");
    }).catchError((error) {
      print("Falha ao coletar os dados: $error");
    });
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
            children: [
              const SizedBox(height: 200), // espaçamento
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
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'sucesso!',
                      style: TextStyle(
                          color: Color(0xFFF9A825),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

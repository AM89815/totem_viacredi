import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';

class Pagina5 extends StatefulWidget {
  const Pagina5({super.key});

  @override
  _Pagina5State createState() => _Pagina5State();
}

class _Pagina5State extends State<Pagina5> {
  final TextEditingController _comentarioController = TextEditingController();

  Future<void> addComentario(String comentario) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'comentario': comentario,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print("Dados coletados (página 5)");
    }).catchError((error) {
      print("Falha ao coletar os dados (página 5): $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLogo: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 175), // espaçamento
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Deixe seu comentário',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF66BB6A),
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
                    onPressed: () async {
                      await addComentario(_comentarioController.text); // adiciona o comentário ao Firestore
                      Navigator.pushNamed(context, '/sixth');
                    },
                    child: const Text('Finalizar comentário'),
                  ),
                ],
              ),
              const SizedBox(height: 25), // espaçamento
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 0.0,
                ),
                child: TextField(
                  controller: _comentarioController,
                  maxLines: 7,
                  style: const TextStyle(fontSize: 28),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Digite seu comentário aqui...',
                    hintStyle: const TextStyle(fontSize: 28),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

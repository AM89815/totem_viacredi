import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';
import 'dart:async';

class Pagina5 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina5({required this.feedbackData, super.key});

  @override
  _Pagina5State createState() => _Pagina5State();
}

class _Pagina5State extends State<Pagina5> {
  final TextEditingController _comentarioController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startInatividadeTimer();
  }

  void _startInatividadeTimer() {
    _timer = Timer(Duration(seconds: 60), () {
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
                      onPressed: () {
                        _timer?.cancel(); // cancela o temporizador
                        widget.feedbackData.comentario = _comentarioController.text; // armazena o comentario
                        Navigator.pushNamed(context, '/sixth', arguments: widget.feedbackData);
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
      ),
    );
  }
}

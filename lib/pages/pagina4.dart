import 'package:flutter/material.dart';
import 'package:totem/background/basepage.dart';
import 'package:totem/feedbackdata.dart';
import 'dart:async';

class Pagina4 extends StatefulWidget {
  final FeedbackData feedbackData;

  const Pagina4({required this.feedbackData, super.key});

  @override
  _Pagina4State createState() => _Pagina4State();
}

class _Pagina4State extends State<Pagina4> {
  final TextEditingController _cpfController = TextEditingController();
  String _errorMessage = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startInatividadeTimer();
  }

  void _startInatividadeTimer() {
    _timer = Timer(Duration(seconds: 10), () {
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

  bool _isValidCPF(String cpf) {
    // remove caracteres que não são números
    cpf = cpf.replaceAll('.', '').replaceAll('-', '');

    // verifica se o CPF tem 11 dígitos ou se todos os dígitos são iguais
    if (cpf.length != 11 || RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

    // calcula o primeiro dígito verificador
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cpf[i]) * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;

    // calcula o segundo dígito verificador
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(cpf[i]) * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;

    // verifica se os dígitos verificadores são válidos
    return firstDigit == int.parse(cpf[9]) && secondDigit == int.parse(cpf[10]);
  }

  void _numeroBotaoPressionado(String numero) {
    setState(() {
      if (_cpfController.text.length < 14) {
        if (_cpfController.text.length == 3 ||
            _cpfController.text.length == 7) {
          _cpfController.text += '.';
        } else if (_cpfController.text.length == 11) {
          _cpfController.text += '-';
        }
        _cpfController.text += numero;
      }
      _errorMessage = ''; // limpa a mensagem de erro
    });
  }

  void _onBackspacePressionado() {
    setState(() {
      if (_cpfController.text.isNotEmpty) {
        _cpfController.text =
            _cpfController.text.substring(0, _cpfController.text.length - 1);
        if (_cpfController.text.endsWith('.') ||
            _cpfController.text.endsWith('-')) {
          _cpfController.text =
              _cpfController.text.substring(0, _cpfController.text.length - 1);
        }
      }
    });
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
              children: [
                const SizedBox(height: 160), // espaçamento
                Container(
                  width: 500,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(2, 119, 189, 1), width: 4.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          controller: _cpfController,
                          readOnly: true, // evita que o teclado do dispositivo apareça
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(2, 119, 189, 1),
                          ),
                          textAlign: TextAlign.center, // centraliza o texto
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(4.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5), // espaçamento
                      _numeroConstrutorPad(),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // espaçamento
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFF9A825),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 30.0),
                        textStyle: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        _timer?.cancel(); // cancela o temporizador
                        if (_isValidCPF(_cpfController.text)) {
                          widget.feedbackData.cpf =
                              _cpfController.text; // armazena o CPF
                          Navigator.pushNamed(context, '/fifth',
                              arguments: widget.feedbackData);
                        } else {
                          setState(() {
                            _errorMessage =
                                'CPF inválido. Por favor, insira um CPF válido.';
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(_errorMessage),
                              backgroundColor: Colors.red,
                            ));
                          });
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
                Visibility(
                  visible: _errorMessage.isNotEmpty,
                  child: Text(
                    _errorMessage,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // espaçamento
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _numeroConstrutorPad() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _numeroConstrutorRow(['1', '2', '3']),
        _numeroConstrutorRow(['4', '5', '6']),
        _numeroConstrutorRow(['7', '8', '9']),
        _numeroConstrutorRow(['', '0', '<']),
      ],
    );
  }

  Widget _numeroConstrutorRow(List<String> numeros) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: numeros.map((numero) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            onPressed: numero == '<'
                ? _onBackspacePressionado
                : () => _numeroBotaoPressionado(numero),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(130, 70),
              backgroundColor: const Color.fromRGBO(2, 119, 189, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: numero == '<'
                ? const Icon(Icons.backspace, size: 40, color: Colors.white)
                : Text(
                    numero,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      }).toList(),
    );
  }
}

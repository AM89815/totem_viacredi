import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totem/feedbackdata.dart';
import 'package:totem/pages/pagina1.dart';
import 'package:totem/pages/pagina2.dart';
import 'package:totem/pages/pagina3.dart';
import 'package:totem/pages/pagina4.dart';
import 'package:totem/pages/pagina5.dart';
import 'package:totem/pages/pagina6.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: 'Totem Viacredi',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Pagina1(feedbackData: FeedbackData()),
      '/second': (context) => Pagina2(feedbackData: ModalRoute.of(context)!.settings.arguments as FeedbackData),
      '/third': (context) => Pagina3(feedbackData: ModalRoute.of(context)!.settings.arguments as FeedbackData),
      '/forth': (context) => Pagina4(feedbackData: ModalRoute.of(context)!.settings.arguments as FeedbackData),
      '/fifth': (context) => Pagina5(feedbackData: ModalRoute.of(context)!.settings.arguments as FeedbackData),
      '/sixth': (context) => Pagina6(feedbackData: ModalRoute.of(context)!.settings.arguments as FeedbackData),
    },
  ));
}

/*
RESUMO:
  As páginas de 1-5 tem um timer de inatividade que levam o usuário até a página 6,
a página 6 é onde todas as informações do usuário são enviadas ao firebase, ela exibe
uma mensagem de obrigado e direciona o usuário de volta a página 1 depois de um timer.

PÁGINAS 1 E 2:
  Nas páginas 1 e 2 não é necessário apertar o botão de enviar para enviar suas informações,
pois isso já acontece depois que o timer de inatividade te levar pra página 6.

PÁGINA 3:
  A página 3 não coleta nenhum dado, apenas os repassa adiante, ela exibe ao usuário a opção de
enviar seu cpf, caso sim o usuário é direcionado à página 4, caso não o usuário é direcionado a
página 6, essa página também tem um timer de inatividade que te manda pra página 6.

PÁGINAS 4 E 5:
  As páginas 4 e 5 contém informações mais sensíveis: um cpf que precisa ser validado por uma equação
e um comentário atrelado ao cpf, por isso essas informações só podem ser enviadas depois que o usuário
apertar o botão de enviar, o usúario não precisa enviar um comentário caso tenha inserido seu cpf,
mas é teoricamente impossível enviar um comentário sem ter inserido o cpf, as duas páginas também
tem um timer de inatividade.

PÁGINA 6:
  Como dito no resumo, a página 6 é onde todas as informações do usuário são enviadas ao firebase,
ela exibe uma mensagem de obrigado e direciona o usuário de volta a página 1 depois de um timer.
*/

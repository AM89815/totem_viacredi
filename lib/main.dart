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

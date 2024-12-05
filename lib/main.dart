import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totem/pages/pagina1.dart';
import 'package:totem/pages/pagina2.dart';
import 'package:totem/pages/pagina3.dart';
import 'package:totem/pages/pagina4.dart';
import 'package:totem/pages/pagina5.dart';
import 'package:totem/pages/pagina6.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(
    title: 'Totem Viacredi',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Pagina1(),
      '/second': (context) => const Pagina2(),
      '/third': (context) => const Pagina3(),
      '/forth': (context) => const Pagina4(),
      '/fifth': (context) => const Pagina5(),
      '/sixth': (context) => const Pagina6(),
    },
  ));
}

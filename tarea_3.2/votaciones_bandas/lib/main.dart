import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:votaciones_bandas/firebase_options.dart';
import 'main_screen.dart';

void main() async {
  // Inicializa Firebase antes de ejecutar la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
import 'package:ej_firebase/Pagines/Pagina_registre.dart';
import 'package:ej_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaRegistre(),
    );
  }
}



/* 
  1) Tenir node.js instalat
    - En acabar es pot comprobar 
      node -v
      npm -v
      
  2) Anar a la web de firebase i clicar a 'Go to console'
    - Amb la compta iniciada de google

  3) Des de a consola de FireBase creem un projecte de firebase

  4) Anem al menu compilacion i habilitem:
    - Autetication i firestore Database

  5) En una cmd, per exemle la del VS code , fem
    - Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    - npm install -g firebase-tools (instala firebase al dispositiu)
      - firebase login
  
  6) flutter pub global activate flutterfire_cli
  7) C:\Users\l.barba\AppData\Local\Pub\Cache\bin\flutterfire configure

  8) Instalar dependencies (treu el errors de "firebase_options.dart")
   - flutter pub add firebase_core 
   - flutter pub add firebase_auth

    
*/
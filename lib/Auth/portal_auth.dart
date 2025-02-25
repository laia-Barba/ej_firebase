import 'package:ej_firebase/Auth/login_o_registre.dart';
import 'package:ej_firebase/Pagines/Pagina_inici.dart';
import 'package:ej_firebase/Pagines/Pagina_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PortalAuth extends StatelessWidget {
  const PortalAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapShot){
          if (snapShot.hasData) {
            return PaginaInici();
          }else {
            return LoginORegistre();
          }
        },
      ),
    );
  }
}
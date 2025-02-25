import 'package:ej_firebase/Auth/servei_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaInici extends StatelessWidget {
  const PaginaInici({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina inici"),
        actions: [
          IconButton(onPressed: (){
              ServeiAuth().ferLogout();
          }, 
        icon: Icon(Icons.logout),)
        ],
      ),
      body: Text("Pagina d'inici"),
    );
  }
}
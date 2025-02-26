import 'package:ej_firebase/Auth/servei_auth.dart';
import 'package:ej_firebase/Chat/Servei_chat.dart';
import 'package:ej_firebase/Components/Item_usuari.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaInici extends StatefulWidget {
  const PaginaInici({super.key});

  @override
  State<PaginaInici> createState() => _PaginaIniciState();
}

class _PaginaIniciState extends State<PaginaInici> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 88, 93),
        title: Text("Pagina inici"),
        actions: [
          IconButton(onPressed: (){
              ServeiAuth().ferLogout();
          }, 
        icon: Icon(Icons.logout),)
        ],
      ),
      body: StreamBuilder(
          stream: ServeiChat().getUsuaris(), 
          builder: (contex, snapshot){
            
            //Cas que hoi hagi un error
            if (snapshot.hasError) {
              return const Text("Error en el snapshot");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Carregat dades...");
            }

            //Es retornen dades
            return ListView(
              children: snapshot.data!.map<Widget>(
                (dadesUsuari) => _construeixItemUsuari(dadesUsuari)
              ).toList(),
            );
          }
        ),
    );
  }

  Widget _construeixItemUsuari(Map<String,dynamic> dadesUsuari){
    return ItemUsuari(emailUsuari: dadesUsuari["email"]);
  }
}
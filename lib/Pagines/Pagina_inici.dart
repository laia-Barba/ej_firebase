import 'package:ej_firebase/Auth/servei_auth.dart';
import 'package:ej_firebase/Chat/Servei_chat.dart';
import 'package:ej_firebase/Components/Item_usuari.dart';
import 'package:ej_firebase/Pagines/Pagina_chat.dart';
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
        title: Text(ServeiAuth().getUsuariActual()!.email.toString()),
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

    if (dadesUsuari["email"] == ServeiAuth().getUsuariActual()!.email) {
      return Container();
    }

    return ItemUsuari(
      emailUsuari: dadesUsuari["email"],
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaChat(idReceptor: dadesUsuari["uid"],))
        );
      },
    );
  }
}
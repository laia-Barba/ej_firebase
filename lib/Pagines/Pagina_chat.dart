import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ej_firebase/Auth/servei_auth.dart';
import 'package:ej_firebase/Chat/Servei_chat.dart';
import 'package:ej_firebase/Components/Bombolla_missatge.dart';
import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String idReceptor;
  const PaginaChat({super.key, required this.idReceptor});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

final TextEditingController tecMissatge = TextEditingController();
final ScrollController _scrollController = ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 500), (){
      ferScrollCapAvall();
    });
    
  }

void ferScrollCapAvall(){
  _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100, 
        duration: Duration(milliseconds: 500), 
        curve: Curves.fastOutSlowIn
      );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 219, 208, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 88, 93),
        title: const Text("Sala chat"),
      ),
      body: Column(
        children: [

          //Zona missatges
          _crearZonaMostrarMissatges(),
          //Zona escriure missatges
          _crearZonaEscriureMissatges(),
        ],
      ),
    );
  }
  
 Widget _crearZonaMostrarMissatges() {
  return Expanded(
    child:StreamBuilder(
      stream: ServeiChat().getMissatges(ServeiAuth().getUsuariActual()!.uid, widget.idReceptor), 
      builder: (context, snapshot){
        //Cas que hi hagi error.
        if (snapshot.hasError) {
          return Text("Error carregant missatges.");
        }

        //Cas que esta carregant les dades
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Carregant missatges...");
        }

        //Retornar dades
        return ListView(
          controller: _scrollController,
          children: 
            snapshot.data!.docs.map((document) => _contsruirItemMissatge(document)).toList(),
        );
      }
    )
  );
 }
  

 Widget _contsruirItemMissatge(DocumentSnapshot DocumentSnapshot){
  
  Map<String, dynamic> data = DocumentSnapshot.data() as Map<String, dynamic>;

  return BombollaMissatge(missatge: data["missatge"], idAutor: data["idAutor"],);

 }

 Widget _crearZonaEscriureMissatges() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: tecMissatge,
            decoration: const InputDecoration(
              hintText: "Escriu el teu missatge...",
              filled: true,
              fillColor: Color.fromARGB(255, 173, 133, 139),
            ),
          )
        ),
        const SizedBox(width: 10,),
        IconButton(
          onPressed: enviarMissatge, 
          icon: const Icon(Icons.send, color: Colors.white,),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 102, 71, 75))
          ),
        ),
      ],
    ),
  );
 }

void enviarMissatge(){
  if (tecMissatge.text.isNotEmpty) {
    ServeiChat().enviarMissatge(
      widget.idReceptor, 
      tecMissatge.text
    );

    tecMissatge.clear();
    Future.delayed(Duration(milliseconds: 250), (){
      ferScrollCapAvall();
    });
  }
}

}
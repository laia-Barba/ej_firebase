import 'package:ej_firebase/Chat/Servei_chat.dart';
import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String idReceptor;
  const PaginaChat({super.key, required this.idReceptor});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

final TextEditingController tecMissatge = TextEditingController();

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
  return const Expanded(
    child: Text("1")
  );
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
      tecMissatge.text);
  }
}

}
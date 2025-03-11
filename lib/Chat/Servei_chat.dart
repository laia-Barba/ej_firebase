import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ej_firebase/Models/missatge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ServeiChat {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsuaris() {
    return _firestore.collection("Usuaris").snapshots().map((event) {
      return event.docs.map((document) {
        return document.data();
      }).toList();
    });
  }

  Future<void> enviarMissatge(String idReceptor, String missatge) async {
    //La sala de chat es estre dos usuaris, La creem a aprtir dels seus uid's.
    String idUsusariActual = _auth.currentUser!.uid;
    String emailUsuariActual = _auth.currentUser!.email!;
    Timestamp timestamp = Timestamp.now();

    Missatge nouMissatge = Missatge(
        idAutor: idUsusariActual,
        emailAutor: emailUsuariActual,
        idReceptor: idReceptor,
        missatge: missatge,
        timestamp: timestamp);

    List<String> idsUsuaris = [idUsusariActual, idReceptor];
    idsUsuaris
        .sort(); //Ordenem la llista (Aixi sempre es igual), independentment de l'usuari que re la sesio oberta

    String idSalaChat = idsUsuaris.join("_");

    await _firestore
        .collection("SalesChat")
        .doc(idSalaChat)
        .collection("Missatges")
        .add(nouMissatge.retornaMapaMissatge());
  }

  Stream<QuerySnapshot> getMissatges(String idUsusariActual, String idReceptor) {
    //Creem el idSalaChat, igual que quan guradem els missatges
    List<String> idsUsuaris = [idUsusariActual, idReceptor];
    idsUsuaris.sort();
    String idSalaChat = idsUsuaris.join("_");

    //Retornem els missatges d'aquesta sala (d'aquesta collection).
    return _firestore
        .collection("SalesChat")
        .doc(idSalaChat)
        .collection("Missatges")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}

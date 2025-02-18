import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
 
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Fer registre

  Future<UserCredential> registreAmbEmailIPassword (String email, password) async{

    try {

      UserCredential credencialUsuari = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credencialUsuari;

    } on FirebaseAuthException catch (e) {

      throw Exception(e.code);

    }

    

  }
}
import 'package:ej_firebase/Pagines/Pagina_login.dart';
import 'package:ej_firebase/Pagines/Pagina_registre.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginORegistre extends StatefulWidget {
  const LoginORegistre({super.key});

  @override
  State<LoginORegistre> createState() => _LoginORegistreState();
}

class _LoginORegistreState extends State<LoginORegistre> {

  bool mostraPaginaLogin = true;

  void intercanviarPaginesLoginRegistre(){
    setState(() {
      mostraPaginaLogin = !mostraPaginaLogin; 
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mostraPaginaLogin){
      return PaginaLogin(ferClick: intercanviarPaginesLoginRegistre,);
    }else{
      return PaginaRegistre(ferClick: intercanviarPaginesLoginRegistre,);
    }
    
  }
}
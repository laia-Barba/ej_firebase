import 'package:ej_firebase/Auth/servei_auth.dart';
import 'package:ej_firebase/Components/Boto_auth.dart';
import 'package:ej_firebase/Components/TextField_aut.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {
  const PaginaRegistre({super.key});


  void ferRegistre(){

    final ServeiAuth serveiAuth = ServeiAuth();

    serveiAuth.registreAmbEmailIPassword("email@email1.com", "123456");

  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();
    final TextEditingController tecConfPass = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 99, 39, 47),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                  const Icon(
                    Icons.fireplace,
                    size: 120,
                    color: Color.fromARGB(255, 255, 240, 210),
                  ),
                
                const SizedBox(height: 25),
          
                //Frase
                  const Text(
                    "Crea un compte nou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 240, 218),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                
                const SizedBox(height: 25),
          
                //Text divisori
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        )
                      ),
                  
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "Registre",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 240, 218)
                          ),
                        ),
                      ),
                  
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        )
                      ),
                    ],
                  ),
                ),
                //TextField Email
                TextfieldAut(
                  controller: tecEmail, 
                  obscureText: false, 
                  hintText: "Escriu el teu Email"
                ),
                //TextField Password
                TextfieldAut(
                  controller: tecPassword, 
                  obscureText: true, 
                  hintText: "Tria un password"
                ),
                //TextField confirmar password
                TextfieldAut(
                  controller: tecConfPass, 
                  obscureText: true, 
                  hintText: "Reescriu el password"
                ),
          
                SizedBox(height: 10,),

                //No estas registrat registrada
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Ja ets membre?", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 5,),
                      GestureDetector(
                        child: Text(
                          "Fes login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 156, 121, 125)
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10,),

                //Boto registre
                BotoAuth(
                  text: "Registre", 
                  onTap: ferRegistre
                ),
                //Boto registre
                BotoAuth(
                  text: "Logout", 
                  onTap: (){}
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
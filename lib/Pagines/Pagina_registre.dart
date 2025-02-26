import 'package:ej_firebase/Auth/servei_auth.dart';
import 'package:ej_firebase/Components/Boto_auth.dart';
import 'package:ej_firebase/Components/TextField_aut.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {

  final Function()? ferClick;
  const PaginaRegistre({super.key, required this.ferClick});


  void ferRegistre(String email, String password, String confPassword, BuildContext context) async{

    if (password.isEmpty || email.isEmpty) {
      //Gestionar-lo
      return;
    }
    if (password != confPassword) {
      //Gestió del cas
      return;
    }
    String? error = await ServeiAuth().registreAmbEmailIPassword(email, password);

    if (error != null){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 250, 183, 159),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text("Error"),
          content: Text(error),
        )
      );
    }
    

    
    

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        )
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "Registra't",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 218)
                            ),
                          ),
                      ),
                  
                      const Expanded(
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
                        onTap: ferClick,
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
                  onTap: () => ferRegistre(tecEmail.text, tecPassword.text, tecConfPass.text, context)
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
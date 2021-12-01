import 'package:animated_background/animated_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class resultpage extends StatefulWidget {
  int marks = 0;
  resultpage({Key? key, required this.marks})
      : super(key: key); //cambiar required por @required
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> with SingleTickerProviderStateMixin  {
  final firestoreInstance = FirebaseFirestore.instance;
  List<String> images = [
    "images/success.png",
    "images/puntos_altos.png",
    "images/puntos_bajos.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "Deberías esforzarte..\n" + "Puntos Obtenidos $marks";
    } else if (marks < 35) {
      image = images[1];
      message = "Esta mal, pero no tan mal..\n" + "Puntos Obtenidos $marks";
    } else {
      image = images[1];
      message = "Lo hiciste muy bien..\n" + "Puntos Obtenidos $marks";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks,
      [this.image = "images/good.png", this.message = 'bien hecho']); //cambios

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: const BoxDecoration(
        image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/fondo4.png',),
                    fit: BoxFit.cover
                  ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,//orangeAccent,
        body: AnimatedBackground(
              behaviour:BubblesBehaviour(),
              vsync: this,
              child:Column(
          children: <Widget>[
            // ENCABEZADO
            const SizedBox(
                height: 45.0,
              ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "RESULTADO",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 48.0,
                      fontFamily: "Ceviche One",
                    ),
                  ),
                )),

            // PARTE CENTRAL

            Expanded(
              flex: 6,
              child: Material(
                elevation: 10.0,
                child: Column(
                  children: <Widget>[
                    Material(
                      child: SizedBox(
                        width: 200.0,
                        height: 200.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              fontFamily:  "Road Rage",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),

            // parte final

            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    // botón continuar

                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.black,//teal,
                      shadowColor: Colors.white,
                      elevation: 10,
                    ),

                    onPressed: () {
                      Navigator.pushNamed(context, Routes.initJuego);
                      inputData(marks);
                    },
                    child: const Text(
                      "VOLVER A JUGAR",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),)
      ),
    );
  }
  
  void inputData(marks)async {   
    final usu=(context.read<AuthCubit>().state as AuthSignedIn).user;
    DocumentSnapshot<Map<String, dynamic>> resultado= await firestoreInstance.collection("user").doc(usu.uid).get();
    //convertimos ese documento en un map
    final Map<String, dynamic> doc = resultado.data() as Map<String, dynamic> ;
    //del map obtenemos los puntos :"( .....
    firestoreInstance
        .collection("user")
        .doc(usu.uid)
        .update({"puntos": doc['puntos']+marks}).then((_) {
          print('exito');
      });
   }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/bloc/my_user_cubic.dart';
import 'package:flutter_application_1/src/model/user.dart';
import 'package:flutter_application_1/src/repository/implementations/my_user_repository.dart';
import 'package:flutter_application_1/src/ui/juego/quizpage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class homepage extends StatefulWidget {
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubic(MyUserRepository())..getMyUser(),
      child: homepage(),
    );
  }

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: AppBar(
          backgroundColor: Colors.amber.shade700,
          title: const Text(
            "REGIÓN QUEBRADA",
            style: TextStyle(
              fontFamily: "Quando",
              color: Colors.black,
            ),
          ),
        ),
        //-----
        body: BlocBuilder<MyUserCubic, MyUserState>(builder: (_, state) {
          if (state is MyUserReadyState) {
            return _MyUserSection(
              user: state.user,
              pickedImage: state.pickedImage,
              isSaving: state.isSaving,
            );
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}

//---------------------
//Parte encargada de manejar los puntos
class _MyUserSection extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  final bool isSaving;

  const _MyUserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  int puntosReq1 = 0000;
  int puntosReq2 = 2000;
  int puntosReq3 = 3000;
  int puntosReq4 = 4000;
  int puntosReq5 = 5000;
  int puntosDisp = 0;
  //int numero = resultpage(null).obtenerNumero();
  final _puntosController = TextEditingController();
  @override
  void initState() {
    _puntosController.text = widget.user?.puntos.toString() ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    puntosDisp = int.parse(_puntosController.text);
    return (ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all( 5.0),
          decoration: BoxDecoration(color: Colors.amber.shade400, ),
          child: TextField(
            controller: _puntosController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'PUNTOS ACUMULADOS'),
          ),
        ),

        Image.asset(
            'images/coyita2.png',
            width: 200,
            height: 200,
          ),
        customcard("NIVEL 1", images[0], puntosDisp, puntosReq1),
        customcard("NIVEL 2", images[1], puntosDisp, puntosReq2),
        customcard("NIVEL 3", images[2], puntosDisp, puntosReq3),
      ],
    ));
  }
  List<String> images = [
    "images/carnaval.jpg",
    "images/cardon.jpg",
    "images/Imagen1.jpg",
  ];
  Widget customcard(String langname, String image, int puntosDisp,
      int puntosReq) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 50.0,
      ),
      child: InkWell(
        onTap: () {
          if (puntosDisp >= puntosReq) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => getjson(langname),
            ));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text('Puntos no suficientes para este nivel...'),
                  );
                });
          }
        },
        child: Material(
          color: Colors.blue,//green[700],
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(100.0),
                        child: Container(
                          // changing from 200 to 150 as to look better
                          height: 45.0,
                          width: 45.0,
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                image,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                            langname ,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: "Quando",
                              fontWeight: FontWeight.w700,
                            ),
                        ),
                        Text(
                            'Puntos necesarios : ' + puntosReq.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: "Quando",
                              fontWeight: FontWeight.w700,
                            ),
                  ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

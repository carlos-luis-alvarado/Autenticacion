import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/bloc/my_user_cubic.dart';
import 'package:flutter_application_1/src/model/user.dart';
import 'package:flutter_application_1/src/repository/implementations/my_user_repository.dart';
import 'package:flutter_application_1/src/ui/juego/quizpage.dart';
import 'package:flutter_application_1/src/ui/juego/resultpage.dart';
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
            "Visita Jujuy¡!",
            style: TextStyle(
              fontFamily: "Quando",
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
  int puntosReq1 = 1000;
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
        TextField(
          controller: _puntosController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Puntos'),
        ),
        customcard("NIVEL 1", images[0], des[0], puntosDisp, puntosReq1),
        customcard("NIVEL 2", images[1], des[1], puntosDisp, puntosReq2),
        customcard("NIVEL 3", images[2], des[2], puntosDisp, puntosReq3),
        customcard("NIVEL 4", images[3], des[3], puntosDisp, puntosReq4),
        customcard("NIVEL 5", images[4], des[4], puntosDisp, puntosReq5),
      ],
    ));
  }

  List<String> images = [
    "images/carnaval.jpg",
    "images/cardon.jpg",
    "images/llama1.jpg",
    "images/pachamama.jpg",
    "images/vicuñas.jpg",
  ];

  List<String> des = [
    //presentación de los bloques de la pantalla
    "Humahuaca\n... \n... !!",
    "Tilcara\n ...!!",
    "Purmamarca\n... !",
    "Abrapampa\n.. ",
    "El hornocal\n...!",
  ];
  Widget customcard(String langname, String image, String des, int puntosDisp,
      int puntosReq) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
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
                  return AlertDialog(
                    title: Text('Puntos no suficientes para este nivel...'),
                  );
                });
          }
        },
        child: Material(
          color: Colors.green[700],
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
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
                Center(
                  child: Text(
                    langname +
                        ' ' +
                        'Puntos necesarios : ' +
                        puntosReq.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

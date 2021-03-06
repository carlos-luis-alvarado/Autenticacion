import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/my_user_cubic.dart';
import 'package:flutter_application_1/src/model/user.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_application_1/src/repository/implementations/my_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class region extends StatefulWidget {

  const region({Key? key}) : super(key: key);
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubic(MyUserRepository())..getMyUser(),
      child: const region(),
    );}

  @override
  State<region> createState() => _regionState();
}

class _regionState extends State<region> {
  int _paginaActual=0;
  //List<Widget>_paginas=[HomeScreem(),IntroScreem()];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
             backgroundColor: Colors.pink[800],
             centerTitle: true,
             title: const Text('¡Pulsa una región!',
                style: TextStyle(
                  color: Colors.white,
                  //fontFamily: 'Architects Daughter',
                  fontSize: 25.0
                ),
              ),
           ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index)=>setState(()=> _paginaActual=index),
         currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home',),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),label: 'login')
        ],
        backgroundColor: Colors.pink[800],
        ),
      body: BlocBuilder<MyUserCubic, MyUserState>(
        builder: (_, state) {
          if (state is MyUserReadyState) {
            return _MyUserSection(
              user: state.user,
              pickedImage: state.pickedImage,
              isSaving: state.isSaving,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
class _MyUserSection extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  final bool isSaving;

  const _MyUserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
 _region1 createState() => _region1();
}

class _region1 extends State<_MyUserSection > {
  final firestoreInstance = FirebaseFirestore.instance;
  final _puntosController = TextEditingController();
  @override
  void initState() {
    _puntosController.text = widget.user?.puntos.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      //height: MediaQuery.of(context).size.height - 200.0,
      decoration: const BoxDecoration(
        image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/color1.jpg',),
                    fit: BoxFit.cover
                  ),
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:Center(
                child: Stack(
                  children:[ 
                    const Align(//UBICAR IMÁGEN
                    alignment:Alignment(0.30,-0.7),
                    child: Image(
                    image: AssetImage(
                         'images/regiones.png',
                    ),
                    width: 300,
                   ),         
                  ),
                    Align(
                      alignment:const Alignment(-0.90,-0.84),
                      child: _buttonRegion('Puna')
                      ),
                    Align(
                      alignment:const Alignment(0.75,-0.67),
                      child: _buttonRegion('Quebrada')
                    ),
                    Align(
                      alignment:const Alignment(0.90,-0.1),
                      child: _buttonRegion('Valles')
                    ),
                    Align(
                      alignment:const Alignment(-0.20,-0.05),
                      child: _buttonRegion('Yungas')
                    ),
                    const Align(//UBICAR IMÁGEN
                    alignment:Alignment.bottomCenter,
                    child: Image(
                    image: AssetImage(
                         'images/imagen10.png',
                    ),
                    width: 300,
                   ),
                    ) 
                     
                  ]
                ),
              ),
          ), 
        );
  }
    Widget _buttonRegion(String nombre) {
      return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Text(nombre,
              style: const TextStyle(
                      color: Colors.white,
                    ),),
            onPressed: () {
              Navigator.pushNamed(context, Routes.homeJuego);
           // inputData1();
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(95, 95),
                primary: Colors.blue[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)))
        );
    });
    }
    
}

  
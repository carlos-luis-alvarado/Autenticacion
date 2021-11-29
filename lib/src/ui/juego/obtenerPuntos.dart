
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/juego/UsuarioJuego.dart';

class MyLogicj {
  final String uid;
  MyLogicj(this.uid);
   ValueNotifier<usuarioJuego>usuario=ValueNotifier(usuarioJuego(name: '', puntos: 0));
  void getUsuario()async{
      final snapshot= await FirebaseFirestore.instance.collection('user')..doc(uid).get();
      usuario.value= usuarioJuego.fromMap(snapshot);
      print('PUNTOSSS....///////////////////////////////////.${usuario.value.puntos}');
    }
  
  }

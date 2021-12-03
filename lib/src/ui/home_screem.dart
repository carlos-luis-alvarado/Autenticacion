import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_application_1/src/widgets/card_swiper1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreem extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: const Text('Conozcamos jujuy'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthCubit>().signOut(),
          ),
          IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              })
        ],
      ),
      
      body: Container(
        decoration: const BoxDecoration(
        image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/color4.jpg',),
                    fit: BoxFit.cover
                  ),
         ),
        child: Expanded(
          child:Column(
          children: [
            Align(
                     alignment:Alignment.bottomLeft,
                     child: _SwiperTarjetas(),
                     ),
            const Align(
                     alignment:Alignment.center,
                     child: Text('para mas información click sobre la imágen')
                     ),
                const Align(
                alignment:Alignment(0,0),
                   child: Image(
                   image: AssetImage(
                        'images/imagen6.png',
                   ),
                   width: 230,
                  ),),
                 _ButtonLogin(),
          ],
        ),
         
         )
        
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, Routes.initJuego);
            },
            icon: const Icon(
              Icons.input_outlined,
            ),
            label: const Text('jugar'),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(140, 30),
                primary: Colors.pink[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, Routes.premiosJ);
            },
            icon: const Icon(
              Icons.input_outlined,
            ),
            label: const Text('Premios'),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(140, 40),
                primary: Colors.blue[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
      ]);
    });
  }
}
class _SwiperTarjetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardSwiper();
  }
}

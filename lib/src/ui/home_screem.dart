import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/bloc/my_user_cubic.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_application_1/src/ui/profile.dart';
import 'package:flutter_application_1/src/widgets/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//-----------------------------
import 'package:flutter_meedu/flutter_meedu.dart';

//import 'package:flutter_application_1/src/widgets/card_swiper.dart';

class HomeScreem extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => context.read<AuthCubit>().signOut(),
          ),
          IconButton(
              icon: Icon(Icons.account_circle_rounded),
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              })
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _SwiperTarjetas(),
            const SizedBox(
              height: 50.0,
            ),
            _ButtonLogin(), //boton ingresar
          ],
        ),
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Column(children: <Widget>[
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, Routes.homeJuego);
            },
            icon: const Icon(
              Icons.input_outlined,
            ),
            label: const Text('jugar'),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 30),
                primary: Colors.green.shade500,
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
                fixedSize: const Size(200, 30),
                primary: Colors.blue.shade500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
      ]);
    });
  }
}

class _SwiperTarjetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize= MediaQuery.of(context).size;
    List<String> imgList = [
      "https://promociones-aereas.com.ar/wp-content/uploads/2019/09/10-lugares-en-jujuy-que-no-podes-perderte-los-colorados-cerro-7-colores-purmamarca-holding-world-1-1024x512.jpg.webp",
      "https://media.viajando.travel/p/a30dd40bd762703afe2526904b7ed794/adjuntos/255/imagenes/000/348/0000348488/jujuy-salinas-grandesjpg.jpg",
      "https://promociones-aereas.com.ar/wp-content/uploads/2019/09/10-lugares-en-jujuy-que-no-podes-perderte-en-jujuy-cerro-monta%C3%B1a-chani-1024x681.jpg.webp",
      "https://media.viajando.travel/p/5630ab283257e18d749bfc4fb0633e63/adjuntos/255/imagenes/000/348/0000348478/jujuy-laguna-pozuelosjpg.jpg",
      "https://media.viajando.travel/p/6732af207ecea5fec7733259663cbd82/adjuntos/255/imagenes/000/348/0000348458/jujuy-barrancasjpg.jpg",
      "https://www.patagonline.com/wp-content/uploads/2020/10/Screenshot-2020-10-20-at-14.46.48.jpg",
      "https://viajerosocultos.com/wp-content/uploads/2021/05/20210515_113848_HDR-scaled.jpg",
      "https://www.periodicolea.com.ar/wp-content/uploads/2019/02/pag-1-Jueves-de-Compadres.jpg",
      "https://www.nordic-travel.com.ar/es/wp-content/uploads/2020/06/humahuaca-galeria-5.jpg",
      "https://www.quebradadehumahuaca.com/info-gral/imagenes/quebrada-de-humahuaca-pucara-tilcara.jpg",
      "https://tripin.travel/wp-content/uploads/2020/05/Purmamarca-Jujuy.jpg",
      "https://somosjujuy-wordpress.s3.amazonaws.com/wp-content/uploads/2021/01/06171110/carnaval.jpg",
      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/f6/70/ea/inca-cueva.jpg?w=1200&h=-1&s=1",
      "https://media.todojujuy.com/p/677000a117e3dc0611d6550112cbc802/adjuntos/227/imagenes/003/194/0003194169/quebrada-las-senoritas-foto-porafuerita.png?2021-10-06-11-09-29",
    ];
    
    return CardSwiper(lugares:imgList);
  }
}

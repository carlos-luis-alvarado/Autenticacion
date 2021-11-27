import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/bloc/my_user_cubic.dart';
import 'package:flutter_application_1/src/repository/implementations/auth_repository.dart';
import 'package:flutter_application_1/src/repository/implementations/my_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authCubit = AuthCubit(AuthRepository());
  //poniedo un multiprovider se puede invocarlo de todas partes de la app supuestamente
  runApp(MultiBlocProvider(
    providers: [
    BlocProvider(
    create: (_) => authCubit..init(),),
    BlocProvider(
      create: (_) => MyUserCubic(MyUserRepository())..getMyUser(),
    )
    ],
    child: MyApp.create(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_application_1/src/ui/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previus, current) => current is AuthSignedIn,
          builder: (_, state) {
            final AuthUser = (state as AuthSignedIn).user;
            return Center(
              child: Column(
                children: [
                  Text('User: ${AuthUser.uid}'),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<AuthCubit>().signOut(),
                    child: Text('Logout'),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

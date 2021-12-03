import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/bloc/my_user_cubic.dart';
import 'package:flutter_application_1/src/model/user.dart';
import 'package:flutter_application_1/src/repository/implementations/my_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubic(MyUserRepository())..getMyUser(),
      child: Profile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de usuario'),
        backgroundColor: Colors.cyan[900],
        //backgroundColor: Colors.green.shade500,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => context.read<AuthCubit>().signOut(),
          ),
        ],
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
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _puntosController = TextEditingController();
  final picker = ImagePicker();

  @override
  void initState() {
    _nameController.text = widget.user?.name ?? '';
    _lastNameController.text = widget.user?.lastname ?? '';
    _puntosController.text = widget.user?.puntos.toString() ?? '';
    super.initState();
  }

  //cuando el usuario es nuevo
  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset('images/perfil.png', fit: BoxFit.fill);
    //cuando seleccionamos una imagen
    if (widget.pickedImage != null) {
      image = Image.file(
        widget.pickedImage!,
        fit: BoxFit.fill,
      );
      //imagen del usuario
    } else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      image = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        fit: BoxFit.fill,
      );
    }
    return Container(
        decoration: const BoxDecoration(
        image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/color2.jpg',),
                    fit: BoxFit.cover
                  ),
        ),
        padding: const EdgeInsets.all(20),
        child:Scaffold(
              backgroundColor: Colors.transparent,
              body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final pickedImage =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null)
                  context.read<MyUserCubic>().setImage(File(pickedImage.path));
              },
              child: Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: image,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (_, current) => current is AuthSignedIn,
                builder: (_, state) {
                  return Center(
                    child: Text('UID: ${(state as AuthSignedIn).user.uid}'),
                  );
                }),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre',icon:Icon(Icons.person_add,color: Colors.black,)),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Apellido',icon:Icon(Icons.person_add,color: Colors.black,)),
            ),
            const SizedBox(height: 8),
            TextField(
              enabled: false,
              controller: _puntosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Puntos',icon:Icon(Icons.favorite,color: Colors.black)),
            ),
            const SizedBox(height: 20),

            Stack(
              children: [
                ElevatedButton(
                    onPressed: widget.isSaving
                        ? null
                        : () {
                            context.read<MyUserCubic>().saveMyUser(
                                (context.read<AuthCubit>().state
                                        as AuthSignedIn)
                                    .user
                                    .uid,
                                _nameController.text,
                                _lastNameController.text,
                                int.tryParse(_puntosController.text) ?? 0);
                          },
                    child: const Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 40),
                        primary: Colors.cyan[900],
                        //primary: Colors.green.shade500,
                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))
                      )
                    ),
                if (widget.isSaving) const CircularProgressIndicator(),
              ],
            )
          ],
        ),
      ),)
    );
  }
}

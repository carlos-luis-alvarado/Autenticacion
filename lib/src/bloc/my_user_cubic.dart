import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/src/model/user.dart';
import 'package:flutter_application_1/src/repository/my_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyUserCubic extends Cubit<MyUserState> {
  final MyUserRepositoryBase _userRepository;
  File? _pickedImage;
  late MyUser _user;

  MyUserCubic(this._userRepository) : super(MyUserLoadingState());
  void setImage(File? imageFile) async {
    _pickedImage = imageFile;
    emit(MyUserReadyState(_user, _pickedImage));
  }

  Future<void> getMyUser() async {
    emit(MyUserLoadingState());
    _user = (await _userRepository.getMyUser()) ?? MyUser('', '', '', 0);
    emit(MyUserReadyState(_user, _pickedImage));
  }

  Future<void> saveMyUser(
      String uid, String name, String lastname, int puntos) async {
    _user = MyUser(uid, name, lastname, puntos, image: _user.image);
    emit(MyUserReadyState(_user, _pickedImage, isSaving: true));
    await Future.delayed(Duration(seconds: 3));
    await _userRepository.saveMyUser(_user, _pickedImage);
    emit(MyUserReadyState(_user, _pickedImage));
  }
}

abstract class MyUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyUserLoadingState extends MyUserState {}

class MyUserReadyState extends MyUserState {
  final MyUser user;
  final File? pickedImage;
  final isSaving;

  MyUserReadyState(this.user, this.pickedImage, {this.isSaving = false});
  @override
  List<Object?> get props => [user, pickedImage?.path, isSaving];
}

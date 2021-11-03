import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String uid;
  final String? email;

  AuthUser(this.uid, this.email);

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}

abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onOuthStateChanged;
  Future<AuthUser?> signInAnonymously();
  Future<AuthUser?> signInWithGoogle();
  Future<AuthUser?> signInWithFacebook();
  Future<AuthUser?> createUserWithEmailAndPassword(
      String email, String password);
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

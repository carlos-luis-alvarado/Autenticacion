import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final int puntos;

  final String? image;

  MyUser(this.id, this.name, this.lastname, this.puntos, {this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastname': lastname,
      'puntos': puntos,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data)
      : id = data['id'] as String,
        name = data['name'] as String,
        lastname = data['lastname'] as String,
        puntos = data['puntos'] as int,
        image = data['image'] as String?;
}

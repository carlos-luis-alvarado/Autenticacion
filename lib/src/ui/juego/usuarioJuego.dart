class usuarioJuego{
  final String name;
  final num puntos;

  usuarioJuego({
    required this.name, 
    required this.puntos});

  factory usuarioJuego.fromMap(dynamic data)=>
  usuarioJuego(name: data['name'] ,
        puntos: data['puntos'] );
}
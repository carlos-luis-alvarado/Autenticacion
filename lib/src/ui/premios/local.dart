

class local {
  final String nombre;
  final String descripcion;
  final String direccion;
  final num puntos;
  final String imagen;

  local({required this.nombre, 
        required this.descripcion,
        required this.direccion,
        required this.puntos,
        required this.imagen
       });
  
  factory local.fromMap(dynamic data)=>
  local(nombre: data['nombre'] , 
        descripcion:data['descripcion'], 
        direccion: data['direccion'], 
        puntos:data['puntos'],
        imagen:data['imagen']
        );
}
class lugar{
  final String nombre;
  final String descripcion;
  final String direccion;
  final String imagen;

  lugar({
    required this.nombre, 
    required this.descripcion, 
    required this.direccion, 
    required this.imagen});

  factory lugar.fromMap(dynamic data)=>
  lugar(nombre: data['nombre'] , 
        descripcion:data['descripcion'], 
        direccion: data['direccion'], 
        imagen:data['imagen']
        );
}
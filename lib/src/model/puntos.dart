import 'food.dart';

class Puntos {
  String name;
  String label;
  String logourl;
  String desc;
  num score;
  Map<String, List<Food>> locales;
  Puntos(
      this.name, this.label, this.logourl, this.desc, this.score, this.locales);
  static Puntos generarCategorias() {
    return Puntos('Reclama tu premio', 'Puntos obtenidos',
        'images/crearlogo.png', 'Selecciona una categoria', 500, {
      'Heladeria': Food.generarHeladerias(),
      'Panaderia': Food.generarPanaderias(),
      'Restaurantes': Food.generarRestaurante(),
      'Despensas': Food.generarHeladerias(),
      'Hospedajes': Food.generarHeladerias(),
    });
  }
}

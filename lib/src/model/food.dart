class Food {
  String imgUrl;
  String desc;
  String name;
  String puntos;
  num score;
  String region;
  num price;
  num quantity;
  List<Map<String, String>> direccion;
  String about;
  bool hightLight;
  Food(this.imgUrl, this.desc, this.name, this.puntos, this.score, this.region,
      this.price, this.quantity, this.direccion, this.about,
      {this.hightLight = false});

  static List<Food> generarHeladerias() {
    return [
      Food(
          'images/descarga.jfif',
          '1000 puntos: 20% de descuento',
          'Grido',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Cucurucho Grido': 'images/helado2.jpg',
            },
            {
              'Sundada': 'images/helado4.jfif',
            },
            {
              'Bonbom helado': 'images/helado5.jfif',
            },
            {
              'Medio kilo': 'images/helado1.jpg',
            },
            {
              'Super Gridito': 'images/helado3.jfif',
            },
          ],
          'lala',
          hightLight: true),
      Food(
          'images/helapana.jfif',
          '1000 puntos: 20% de descuento',
          'Helapaana',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Batido': 'images/BATIDO.png',
            },
            {
              'Cucurucho': 'images/conohelapana.jfif',
            },
            {
              '3 listros': 'images/3litros.jfif',
            },
            {
              'Medio kilo': 'images/cuartopana.jfif',
            },
            {
              'Cuarto': 'images/UN-CUARTO.png',
            },
          ],
          'lala',
          hightLight: true),
      Food(
          'images/viabana.jfif',
          '1000 puntos: 20% de descuento',
          'Viabana',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Batido': 'images/BATIDO.png',
            },
            {
              'Cucurucho': 'images/conohelapana.jfif',
            },
            {
              '3 listros': 'images/3litros.jfif',
            },
            {
              'Medio kilo': 'images/cuartopana.jfif',
            },
            {
              'Cuarto': 'images/UN-CUARTO.png',
            },
          ],
          'lala',
          hightLight: true),
    ];
  }

  static List<Food> generarPanaderias() {
    return [
      Food(
          'images/buendia.jfif',
          '1000 puntos: 20% de descuento',
          'Buen Dia',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Maicenas': 'images/maicenitas.jpeg',
            },
            {
              'Roquete': 'images/rosquetes.jpg',
            },
            {
              'Empanadillas': 'images/empanadillas.jfif',
            },
            {
              'Facturas': 'images/facturas.jfif',
            },
            {
              'Buñuelos': 'images/helado5.jfif',
            },
          ],
          'lala',
          hightLight: true),
      Food(
          'images/alameda.png',
          '1000 puntos: 20% de descuento',
          'Alameda',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Maicenas': 'images/maicenitas.jpeg',
            },
            {
              'Roquete': 'images/rosquetes.jpg',
            },
            {
              'Empanadillas': 'images/empanadillas.jfif',
            },
            {
              'Facturas': 'images/facturas.jfif',
            },
            {
              'Buñuelos': 'images/helado5.jfif',
            },
          ],
          'lala',
          hightLight: true),
    ];
  }

  static List<Food> generarRestaurante() {
    return [
      Food(
          'images/kuntur.jpg',
          '1000 puntos: 20% de descuento',
          'KUNTUR',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Maicenas': 'images/maicenitas.jpeg',
            },
            {
              'Roquete': 'images/rosquetes.jpg',
            },
            {
              'Empanadillas': 'images/empanadillas.jfif',
            },
            {
              'Facturas': 'images/facturas.jfif',
            },
            {
              'Buñuelos': 'images/helado5.jfif',
            },
          ],
          'lala',
          hightLight: true),
      Food(
          'images/lacomarca.jpg',
          '1000 puntos: 20% de descuento',
          'La comarca',
          'Tus puntos: ',
          2000,
          'Region La Quebrada',
          1000,
          0,
          [
            {
              'Maicenas': 'images/maicenitas.jpeg',
            },
            {
              'Roquete': 'images/rosquetes.jpg',
            },
            {
              'Empanadillas': 'images/empanadillas.jfif',
            },
            {
              'Facturas': 'images/facturas.jfif',
            },
            {
              'Buñuelos': 'images/helado5.jfif',
            },
          ],
          'lala',
          hightLight: true),
    ];
  }
}

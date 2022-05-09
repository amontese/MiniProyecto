class VendedorVista {
  final String nombre;
  //final String descripcion;
  final String uid;
  final String marca;
  final String modelo;
  final double? precio;

  VendedorVista(
      {required this.nombre,
      //required this.descripcion,
      required this.uid,
      required this.marca,
      required this.modelo,
      this.precio});

  factory VendedorVista.fromMap(Map data) {
    return VendedorVista(
        nombre: data['nombre'] ?? '',
        //descripcion: data['descripcion'] ?? '',
        uid: data['uid'] ?? '',
        marca: data['marca'] ?? '',
        modelo: data['modelo'] ?? '',
        precio: data['precio'] ?? '');
  }
}

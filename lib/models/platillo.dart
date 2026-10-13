/// Modelo de datos: representa un platillo de la carta de Casa Arlette.
class Platillo {
  final String id;
  final String nombre;
  final String descripcion; // Texto corto para la tarjeta
  final String descripcionLarga; // Texto completo para el detalle
  final String categoria;
  final double precio;
  final double calificacion;
  final int minutos;
  final List<String> ingredientes;
  final String imagen; // Ruta en assets/imagenes/

  const Platillo({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.descripcionLarga,
    required this.categoria,
    required this.precio,
    required this.calificacion,
    required this.minutos,
    required this.ingredientes,
    required this.imagen,
  });
}
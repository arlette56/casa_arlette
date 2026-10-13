import 'package:flutter/material.dart';

/// Muestra la foto del platillo desde assets. Si la imagen todavía no existe
/// en la carpeta assets/imagenes/, muestra un fondo cálido de relleno.
class ImagenPlatillo extends StatelessWidget {
  final String ruta;

  const ImagenPlatillo({super.key, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ruta,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xFFE2B48A), Color(0xFFBF7A4E)],
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.restaurant,
              size: 40,
              color: Color(0xFFFFFBF5),
            ),
          ),
        );
      },
    );
  }
}
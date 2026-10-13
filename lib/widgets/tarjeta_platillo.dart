import 'package:flutter/material.dart';

import '../models/platillo.dart';
import 'colores_app.dart';
import 'imagen_platillo.dart';

/// Tarjeta (Card) con imagen, título y breve descripción de un platillo.
class TarjetaPlatillo extends StatelessWidget {
  final Platillo platillo;
  final VoidCallback onTap;

  const TarjetaPlatillo({
    super.key,
    required this.platillo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: ColoresApp.tarjeta,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Hero: la imagen "viaja" hacia la pantalla de detalle.
              Hero(
                tag: platillo.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: ImagenPlatillo(ruta: platillo.imagen),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Expanded evita el desbordamiento (RenderFlex overflow).
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      platillo.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'serif',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColoresApp.texto,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      platillo.descripcion,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: ColoresApp.textoSuave,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${platillo.precio.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: ColoresApp.terracota,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
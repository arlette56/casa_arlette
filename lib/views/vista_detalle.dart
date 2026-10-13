import 'package:flutter/material.dart';

import '../models/platillo.dart';
import '../widgets/colores_app.dart';
import '../widgets/imagen_platillo.dart';

/// Pantalla de detalle: recibe el platillo seleccionado desde el inicio.
class VistaDetalle extends StatefulWidget {
  final Platillo platillo;

  const VistaDetalle({super.key, required this.platillo});

  @override
  State<VistaDetalle> createState() => _VistaDetalleState();
}

class _VistaDetalleState extends State<VistaDetalle> {
  bool _esFavorito = false;

  Platillo get platillo => widget.platillo;

  void _mostrarMensaje(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        backgroundColor: ColoresApp.terracota,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen destacada con efecto Hero
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Hero(
                  tag: platillo.id,
                  child: ImagenPlatillo(ruta: platillo.imagen),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _BotonCircular(
                          tooltip: 'Volver',
                          icono: Icons.arrow_back,
                          alPresionar: () => Navigator.pop(context),
                        ),
                        _BotonCircular(
                          tooltip: 'Favorito',
                          icono: _esFavorito
                              ? Icons.favorite
                              : Icons.favorite_border,
                          alPresionar: () {
                            setState(() => _esFavorito = !_esFavorito);
                            _mostrarMensaje(
                              _esFavorito
                                  ? 'Agregado a favoritos'
                                  : 'Quitado de favoritos',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Información detallada
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platillo.nombre,
                    style: const TextStyle(
                      fontFamily: 'serif',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: ColoresApp.texto,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    platillo.categoria,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColoresApp.textoSuave,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Iconos informativos: tiempo, calificación y precio
                  Row(
                    children: [
                      _DatoConIcono(
                        icono: Icons.schedule,
                        texto: '${platillo.minutos} min',
                      ),
                      const SizedBox(width: 24),
                      _DatoConIcono(
                        icono: Icons.star,
                        texto: platillo.calificacion.toString(),
                      ),
                      const SizedBox(width: 24),
                      _DatoConIcono(
                        icono: Icons.attach_money,
                        texto: platillo.precio.toStringAsFixed(0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Text(
                    platillo.descripcionLarga,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: ColoresApp.texto,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ingredientes: ${platillo.ingredientes.join(', ')}.',
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: ColoresApp.textoSuave,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Botón de acción
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: () => _mostrarMensaje('Mesa reservada en Casa Arlette'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColoresApp.terracota,
                foregroundColor: ColoresApp.tarjeta,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Reservar mesa',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Botón redondo que flota sobre la imagen.
class _BotonCircular extends StatelessWidget {
  final IconData icono;
  final String tooltip;
  final VoidCallback alPresionar;

  const _BotonCircular({
    required this.icono,
    required this.tooltip,
    required this.alPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColoresApp.tarjeta,
      shape: const CircleBorder(),
      child: IconButton(
        tooltip: tooltip,
        onPressed: alPresionar,
        icon: Icon(icono, color: ColoresApp.terracota),
      ),
    );
  }
}

/// Icono pequeño con un dato al lado (ej. tiempo, calificación).
class _DatoConIcono extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _DatoConIcono({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icono, size: 20, color: ColoresApp.terracota),
        const SizedBox(width: 6),
        Text(
          texto,
          style: const TextStyle(fontSize: 15, color: ColoresApp.texto),
        ),
      ],
    );
  }
}
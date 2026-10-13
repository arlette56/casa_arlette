import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/colores_app.dart';
import 'vista_inicio.dart';

/// Pantalla de bienvenida (Splash): pasa sola al inicio a los 3 segundos.
class VistaBienvenida extends StatefulWidget {
  const VistaBienvenida({super.key});

  @override
  State<VistaBienvenida> createState() => _VistaBienvenidaState();
}

class _VistaBienvenidaState extends State<VistaBienvenida> {
  Timer? _temporizador;

  @override
  void initState() {
    super.initState();
    _temporizador = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const VistaInicio()),
      );
    });
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColoresApp.fondo,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.room_service_outlined,
              size: 56,
              color: ColoresApp.terracota,
            ),
            SizedBox(height: 20),
            Text(
              'Casa Arlette',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 40,
                color: ColoresApp.texto,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: ColoresApp.terracota,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
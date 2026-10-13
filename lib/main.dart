import 'package:flutter/material.dart';

import 'views/vista_bienvenida.dart';
import 'widgets/colores_app.dart';

void main() {
  runApp(const CasaArletteApp());
}

class CasaArletteApp extends StatelessWidget {
  const CasaArletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casa Arlette',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ColoresApp.fondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColoresApp.terracota,
          primary: ColoresApp.terracota,
          surface: ColoresApp.fondo,
        ),
      ),
      home: const VistaBienvenida(),
    );
  }
}
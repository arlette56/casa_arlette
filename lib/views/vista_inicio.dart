import 'package:flutter/material.dart';

import '../models/platillo.dart';
import '../models/platillos_ficticios.dart';
import '../widgets/colores_app.dart';
import '../widgets/tarjeta_platillo.dart';
import 'vista_detalle.dart';

/// Pantalla principal: búsqueda, categorías y lista de platillos.
class VistaInicio extends StatefulWidget {
  const VistaInicio({super.key});

  @override
  State<VistaInicio> createState() => _VistaInicioState();
}

class _VistaInicioState extends State<VistaInicio> {
  String _categoriaSeleccionada = 'Todos';
  String _busqueda = '';

  List<Platillo> get _platillosFiltrados {
    return platillosFicticios.where((p) {
      final coincideCategoria = _categoriaSeleccionada == 'Todos' ||
          p.categoria == _categoriaSeleccionada;
      final coincideBusqueda =
          p.nombre.toLowerCase().contains(_busqueda.toLowerCase());
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final platillos = _platillosFiltrados;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColoresApp.fondo,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Casa Arlette',
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: ColoresApp.texto,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            onPressed: () {},
            icon: const Icon(Icons.person_outline, color: ColoresApp.texto),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda funcional
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: TextField(
              onChanged: (valor) => setState(() => _busqueda = valor),
              decoration: InputDecoration(
                hintText: 'Buscar platillos',
                hintStyle: const TextStyle(color: ColoresApp.textoSuave),
                prefixIcon:
                    const Icon(Icons.search, color: ColoresApp.textoSuave),
                filled: true,
                fillColor: ColoresApp.tarjeta,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Categorías (chips)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: categorias.map((categoria) {
                final seleccionada = categoria == _categoriaSeleccionada;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(categoria),
                    selected: seleccionada,
                    showCheckmark: false,
                    selectedColor: ColoresApp.terracota,
                    backgroundColor: ColoresApp.tarjeta,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                    labelStyle: TextStyle(
                      color:
                          seleccionada ? ColoresApp.tarjeta : ColoresApp.texto,
                    ),
                    onSelected: (_) =>
                        setState(() => _categoriaSeleccionada = categoria),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),

          // Lista dinámica
          Expanded(
            child: platillos.isEmpty
                ? const Center(
                    child: Text(
                      'No encontramos platillos',
                      style: TextStyle(color: ColoresApp.textoSuave),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: platillos.length,
                    itemBuilder: (context, indice) {
                      final platillo = platillos[indice];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: TarjetaPlatillo(
                          platillo: platillo,
                          // Se pasa el objeto seleccionado a la otra pantalla
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    VistaDetalle(platillo: platillo),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
import 'platillo.dart';

/// Categorías para los filtros (chips) de la pantalla de inicio.
const List<String> categorias = [
  'Todos',
  'Entradas',
  'Platos fuertes',
  'Postres',
];

/// Datos ficticios (mock data) que alimentan la app.
const List<Platillo> platillosFicticios = [
  Platillo(
    id: 'tartar',
    nombre: 'Tartar de res',
    descripcion: 'Yema curada, alcaparras y aceite de trufa.',
    descripcionLarga:
        'Corte premium de res picado a cuchillo, con yema curada, alcaparras, '
        'chalote y un delicado aceite de trufa negra. Acompañado de crostini '
        'artesanales.',
    categoria: 'Entradas',
    precio: 380,
    calificacion: 4.9,
    minutos: 15,
    ingredientes: ['Res premium', 'Yema curada', 'Trufa negra', 'Alcaparras'],
    imagen: 'assets/imagenes/tartar.jpg',
  ),
  Platillo(
    id: 'pulpo',
    nombre: 'Pulpo a las brasas',
    descripcion: 'Puré de papa ahumado y aceite de pimentón.',
    descripcionLarga:
        'Pulpo cocinado lentamente y terminado a las brasas, servido sobre '
        'puré de papa ahumado con aceite de pimentón y hierbas frescas.',
    categoria: 'Entradas',
    precio: 490,
    calificacion: 4.9,
    minutos: 20,
    ingredientes: ['Pulpo', 'Papa', 'Pimentón', 'Hierbas'],
    imagen: 'assets/imagenes/pulpo.jpg',
  ),
  Platillo(
    id: 'risotto',
    nombre: 'Risotto de hongos',
    descripcion: 'Arroz carnaroli, hongos silvestres y parmesano.',
    descripcionLarga:
        'Cremoso risotto de arroz carnaroli con una mezcla de hongos '
        'silvestres, mantequilla y parmesano añejo, terminado con trufa.',
    categoria: 'Platos fuertes',
    precio: 420,
    calificacion: 4.8,
    minutos: 25,
    ingredientes: ['Arroz carnaroli', 'Hongos', 'Parmesano', 'Mantequilla'],
    imagen: 'assets/imagenes/risotto.jpg',
  ),
  Platillo(
    id: 'salmon',
    nombre: 'Salmón glaseado',
    descripcion: 'Miel de maple, puré de coliflor y espárragos.',
    descripcionLarga:
        'Lomo de salmón glaseado con miel de maple, servido sobre puré de '
        'coliflor y espárragos salteados al momento.',
    categoria: 'Platos fuertes',
    precio: 450,
    calificacion: 4.7,
    minutos: 22,
    ingredientes: ['Salmón', 'Miel de maple', 'Coliflor', 'Espárragos'],
    imagen: 'assets/imagenes/salmon.jpg',
  ),
  Platillo(
    id: 'filete',
    nombre: 'Filete de res',
    descripcion: 'Reducción de vino tinto y papas confitadas.',
    descripcionLarga:
        'Filete de res a la parrilla con reducción de vino tinto, papas '
        'confitadas y mantequilla de hierbas.',
    categoria: 'Platos fuertes',
    precio: 580,
    calificacion: 4.9,
    minutos: 30,
    ingredientes: ['Filete de res', 'Vino tinto', 'Papas', 'Hierbas'],
    imagen: 'assets/imagenes/filete.jpg',
  ),
  Platillo(
    id: 'fondant',
    nombre: 'Fondant de chocolate',
    descripcion: 'Centro fundido y helado de vainilla.',
    descripcionLarga:
        'Pastel tibio de chocolate con centro fundido, acompañado de helado '
        'de vainilla y una pizca de sal en hojuelas.',
    categoria: 'Postres',
    precio: 190,
    calificacion: 4.9,
    minutos: 12,
    ingredientes: ['Chocolate', 'Mantequilla', 'Vainilla', 'Sal en hojuelas'],
    imagen: 'assets/imagenes/fondant.jpg',
  ),
];
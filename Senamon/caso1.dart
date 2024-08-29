import 'dart:io';
import 'dart:math';
class Senamon {
  String nombre;
  int nivel;
  String tipo;
  double peso;
  int puntosSalud;
  int nivelAtaque;
  int nivelEnergia;
  String descripcion;

  Senamon({
    required this.nombre,
    required this.nivel,
    required this.tipo,
    required this.peso,
    required this.puntosSalud,
    required this.nivelAtaque,
    required this.nivelEnergia,
    required this.descripcion,
  });

  void mostrarInfo() {
    print('Senamon: $nombre, Nivel: $nivel, Tipo: $tipo');
    print('Peso: $peso kg, Salud: $puntosSalud, Ataque: $nivelAtaque');
    print('Energía: $nivelEnergia, Descripción: $descripcion');
  }
}
class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int nivelExperiencia;
  int batallasGanadas;
  List<Senamon> senamones;

  Entrenador({
    required this.nombre,
    required this.email,
    required this.fechaNacimiento,
    this.nivelExperiencia = 0,
    this.batallasGanadas = 0,
    required this.senamones,
  });

  void mostrarInfo() {
    print('Entrenador: $nombre');
    print('Email: $email');
    print('Fecha de Nacimiento: $fechaNacimiento');
    print('Nivel de Experiencia: $nivelExperiencia');
    print('Batallas Ganadas: $batallasGanadas');
    print('Senamones:');
    for (var senamon in senamones) {
      senamon.mostrarInfo();
    }
  }

  void entrenarSenamon(int index, int puntosAtaque, int puntosSalud) {
    if (index < 0 || index >= senamones.length) {
      print('Índice de Senamon no válido.');
      return;
    }

    if (nivelExperiencia >= 200) {
      senamones[index].nivelAtaque += puntosAtaque;
      senamones[index].puntosSalud += puntosSalud;
      nivelExperiencia -= 200; // Restamos 200 puntos de experiencia.
      print('Senamon ${senamones[index].nombre} ha sido entrenado.');
    } else {
      print('No tienes suficientes puntos de experiencia para entrenar.');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:juegoo/ui/triqui/widget.dart';


class Jueguito extends StatefulWidget {
  const Jueguito({
    super.key,
  });

  @override
  State<Jueguito> createState() => _JueguitoState();
}

class _JueguitoState extends State<Jueguito> {
  // Jugador X=1, O=2
  int jugador=1;
  int ganador=0;
  int contadorX=0;
  int contadorO=0;

  
  List<List<int>> jugadas=[
    [0,0,0],
    [0,0,0],
    [0,0,0]
    ];

  Map icono={
    0:Icons.abc,
    1:Icons.close,
    2:Icons.circle_outlined
  };

  void actualizar(int f, int c) {
    if (jugadas[f][c] == 0 && ganador == 0) {
      jugadas[f][c] = jugador;
      if (verificarGanador(f, c)) {
        ganador = jugador;
        if (ganador == 1) {
          contadorX++;
        } else {
          contadorO++;
        }
      } else if (tableroLleno()) {
        ganador = -1;
      } else {
        jugador = (jugador == 1) ? 2 : 1;
      }
      setState(() {});
    }
  }
  bool tableroLleno() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (jugadas[i][j] == 0) {
          return false;
        }
      }
    }
    return true;
  }
   bool verificarGanador(int f, int c) {
    for (int i = 0; i < 3; i++) {
      if (jugadas[f][i] != jugador) {
        break;
      }
      if (i == 2) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (jugadas[i][c] != jugador) {
        break;
      }
      if (i == 2) {
        return true;
      }
    }
    if (f == c) {
      for (int i = 0; i < 3; i++) {
        if (jugadas[i][i] != jugador) {
          break;
        }
        if (i == 2) {
          return true;
        }
      }
    }
    if (f + c == 2) {
      for (int i = 0; i < 3; i++) {
        if (jugadas[i][2 - i] != jugador) {
          break;
        }
        if (i == 2) {
          return true;
        }
      }
    }
    return false;
  }
   void reiniciarJuego() {
    setState(() {
      jugador = 1;
      ganador = 0;
      jugadas = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0],
      ];
    });
  }
  Color getFilaColor(int f, int c) {
  // Verificar fila
  if ((jugadas[f][0] == jugador) &&
      (jugadas[f][1] == jugador) &&
      (jugadas[f][2] == jugador)) {
    return Colors.green;
  }
  // Verificar columna
  if ((jugadas[0][c] == jugador) &&
      (jugadas[1][c] == jugador) &&
      (jugadas[2][c] == jugador)) {
    return Colors.green;
  }
  // Verificar diagonales
  if ((f == c) &&
      (jugadas[0][0] == jugador) &&
      (jugadas[1][1] == jugador) &&
      (jugadas[2][2] == jugador)) {
    return Colors.green; // Diagonal principal
  }
  if ((f + c == 2) &&
      (jugadas[0][2] == jugador) &&
      (jugadas[1][1] == jugador) &&
      (jugadas[2][0] == jugador)) {
    return Colors.green; // Diagonal secundaria
  }
  return Colors.amber; 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trikitake'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Marcador: X - $contadorX, O - $contadorO',
              style: const TextStyle(fontSize: 18),
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              GestureDetector(
                onTap: (){
                    actualizar(0, 0);
                },
                
                child: Elemento(estado: icono[jugadas[0][0]]!, 
                jugado: (jugadas[0][0]>0),
                colorFondo: getFilaColor(0, 0),
                ),
                ),

                 GestureDetector(
                onTap: (){
                    actualizar(0, 1);
                },
                child: Elemento(estado: icono[jugadas[0][1]]!, 
                jugado: (jugadas[0][1]>0),
                colorFondo: getFilaColor(0, 1),
                ),
                ),
                GestureDetector(
                onTap: (){
                    actualizar(0, 2);
                },
                child: Elemento(estado: icono[jugadas[0][2]]!, 
                jugado: (jugadas[0][2]>0),
                colorFondo: getFilaColor(0, 2),
                ),
                ),
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              GestureDetector(
                onTap: (){
                    actualizar(1, 0);
                },
               child: Elemento(estado: icono[jugadas[1][0]]!, 
                jugado: (jugadas[1][0]>0),
                colorFondo: getFilaColor(1,0),
                ),
                ),


                 GestureDetector(
                onTap: (){
                    actualizar(1, 1);
                },
                child: Elemento(estado: icono[jugadas[1][1]]!, 
                jugado: (jugadas[1][1]>0),
                colorFondo: getFilaColor(1,1),
                ),
                ),

                GestureDetector(
                onTap: (){
                    actualizar(1, 2);
                },
                child: Elemento(estado: icono[jugadas[1][2]]!, 
                jugado: (jugadas[1][2]>0),
                colorFondo: getFilaColor(1,2),
                ),
                ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              GestureDetector(
                onTap: (){
                    actualizar(2, 0);
                },
                child: Elemento(estado: icono[jugadas[2][0]]!, 
                jugado: (jugadas[2][0]>0),
                colorFondo: getFilaColor(2,0),
                ),
                ),


                 GestureDetector(
                onTap: (){
                    actualizar(2, 1);
                },
                child: Elemento(estado: icono[jugadas[2][1]]!, 
                jugado: (jugadas[2][1]>0),
                colorFondo: getFilaColor(2,1),
                ),
                ),

                GestureDetector(
                onTap: (){
                    actualizar(2, 2);
                },
                child: Elemento(estado: icono[jugadas[2][2]]!, 
                jugado: (jugadas[2][2]>0),
                colorFondo: getFilaColor(2,2),
                ),
                ),

              
            ],
          ),
          if (ganador != 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                (ganador == -1)
                    ? 'Empate'
                    : (ganador == 1)
                        ? '¡X ha ganado!'
                        : '¡O ha ganado!',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ElevatedButton(
            onPressed: () {
              reiniciarJuego();
            },
            child: const Text('Reiniciar Juego'),
          ),
          
        ],
      )
    );
  }
}


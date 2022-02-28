import 'package:flutter/material.dart';
import 'package:app_sena_mobile/models/areas.dart';

class DetalleProgramas extends StatelessWidget {
  final ContentProgram contentProgram;

  const DetalleProgramas({Key? key, required this.contentProgram})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color.fromARGB(255, 224, 125, 44),
        child: Stack(
          children: <Widget>[
            _fondo(contentProgram),
            _degradado(),
            _contenidoProgramas(contentProgram),
            _back(context),
          ],
        ),
      ),
    );
  }
}

Widget _fondo(ContentProgram contentProgram) {
  return Container(
    child: Image.network(
      contentProgram.fondoDescription,
      fit: BoxFit.cover,
      height: 290.0,
    ),
    constraints: const BoxConstraints.expand(
      height: 285.0,
    ),
  );
}

Widget _degradado() {
  return Container(
    margin: const EdgeInsets.only(top: 190.0),
    height: 110.0,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0x00736AB7),
          Color.fromARGB(255, 224, 125, 44),
        ],
        stops: [0.0, 0.9],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
      ),
    ),
  );
}

Widget _contenidoProgramas(ContentProgram contentProgram) {
  return ListView(
    padding: const EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: [
      Image.network(
        contentProgram.urlDescription,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contentProgram.titleDescription,
              style: const TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              contentProgram.contentDescription,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget _back(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: const BackButton(color: Colors.white),
  );
}

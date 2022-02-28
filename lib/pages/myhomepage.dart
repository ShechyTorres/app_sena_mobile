import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/pages/programas.dart';
import '../models/areas.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App SENA',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          contenido(),
        ],
      ),
    );
  }

  Future<List<Area>?> getAreas() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/ShechyTorres/areas_senaAPI/main/areasSENA.json');
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return areasFromJson(respuesta.body);
    } else {
      return null;
    }
  }

  Widget contenido() {
    return FutureBuilder(
      future: getAreas(),
      builder: (BuildContext context, AsyncSnapshot<List<Area>?> snapshot) {
        final areas = snapshot.data;
        if (snapshot.hasData) {
          return GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(3.0),
            children: <Widget>[
              if (areas != null)
                for (var area in areas)
                  _myCard(
                    area,
                  ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _myCard(Area area) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                  Programas(contentArea: area.contentAreas),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Image.network(
                area.urlAreas,
                width: 150.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}


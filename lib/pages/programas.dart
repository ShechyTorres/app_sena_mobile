import 'package:flutter/material.dart';
import '/models/areas.dart';
import 'myhomepage.dart';
import 'package:app_sena_mobile/pages/detalleProgramas.dart';

class Programas extends StatelessWidget {
  final List<ContentArea> contentArea;

  const Programas({Key? key, required this.contentArea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(const MyHomePage());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Programas',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          _lista(contentArea),
        ],
      ),
    );
  }
}

Widget _lista(contentArea) {
  return ListView.builder(
    itemCount: contentArea.length,
    itemBuilder: (BuildContext context, int index) {
      ContentArea contentAreas = contentArea[index];
      return Column(
        children: [
          _listCard(contentAreas),
        ],
      );
    },
  );
}

Widget _listCard(ContentArea contentAreas) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => DetalleProgramas(contentProgram: contentAreas.contentProgram),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: [
                ListTile(
                  title: Text(
                    contentAreas.titleProgram,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    ),
  );
}

// To parse this JSON data, do
//
//     final areas = areasFromJson(jsonString);

import 'dart:convert';

List<Area> areasFromJson(String str) =>
    List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areasToJson(List<Area> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
  Area({
    required this.idAreas,
    required this.urlAreas,
    required this.titleAreas,
    required this.contentAreas,
  });

  int idAreas;
  String urlAreas;
  String titleAreas;
  List<ContentArea> contentAreas;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        idAreas: json["idAreas"],
        urlAreas: json["urlAreas"],
        titleAreas: json["titleAreas"],
        contentAreas: List<ContentArea>.from(
            json["contentAreas"].map((x) => ContentArea.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idAreas": idAreas,
        "urlAreas": urlAreas,
        "titleAreas": titleAreas,
        "contentAreas": List<dynamic>.from(contentAreas.map((x) => x.toJson())),
      };
}

class ContentArea {
  ContentArea({
    required this.idProgram,
    required this.titleProgram,
    required this.contentProgram,
  });

  int idProgram;
  String titleProgram;
  ContentProgram contentProgram;

  factory ContentArea.fromJson(Map<String, dynamic> json) => ContentArea(
        idProgram: json["idProgram"],
        titleProgram: json["titleProgram"],
        contentProgram: ContentProgram.fromJson(json["contentProgram"]),
      );

  Map<String, dynamic> toJson() => {
        "idProgram": idProgram,
        "titleProgram": titleProgram,
        "contentProgram": contentProgram.toJson(),
      };
}

class ContentProgram {
  ContentProgram({
    required this.fondoDescription,
    required this.urlDescription,
    required this.titleDescription,
    required this.contentDescription,
  });

  String fondoDescription;
  String urlDescription;
  String titleDescription;
  String contentDescription;

  factory ContentProgram.fromJson(Map<String, dynamic> json) => ContentProgram(
    fondoDescription: json['fondoDescription'],
    urlDescription: json['urlDescription'],
    titleDescription: json["titleDescription"],
    contentDescription: json["contentDescription"],
  );

  Map<String, dynamic> toJson() => {
    "fondoDescription": fondoDescription,
    "urlDescription": urlDescription,
    "titleDescription": titleDescription,
    "contentDescription": contentDescription,
  };
}
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String tipo;
  double limiteGasto;

  CategoryModel(
      {@required this.id,
      @required this.name,
      @required this.tipo,
      @required this.limiteGasto});

  factory CategoryModel.fromMap(Map<String, dynamic> obj) => CategoryModel(
        id: obj['id'],
        name: obj['name'],
        tipo: obj['tipo'],
        limiteGasto: obj['votes'],
      );
}

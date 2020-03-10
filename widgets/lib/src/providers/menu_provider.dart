import 'dart:convert';
import 'package:flutter/services.dart';

class _MenuProvider {
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    return dataMap['rutas'];
  }
}

final menuProvider = new _MenuProvider();

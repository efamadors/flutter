import 'package:flutter/material.dart';
import 'package:widgets/src/providers/menu_provider.dart';
import 'package:widgets/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapShot) {
          return ListView(
            children: _listaItems(snapShot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    return data.map((item) {
      return ListTile(
          title: Text(item['texto']),
          leading: getIcon(item['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () => Navigator.pushNamed(context, item['ruta']));
    }).toList();
  }
}
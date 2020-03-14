import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
          itemCount: _listaNumeros.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];

            return FadeInImage(
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$imagen'),
                placeholder: AssetImage('assets/jar-loading.gif'));
          }),
    );
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> _obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}

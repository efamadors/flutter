import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage>{
  final TextStyle _textStyle = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de clicks:', style: _textStyle), 
            Text('$_conteo', style: _textStyle)
          ]
        )
      ),
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      SizedBox(width: 30),
      FloatingActionButton(
        child: Icon(Icons.exposure_zero),
        onPressed:_resetear),
      Expanded(child:SizedBox()),
      FloatingActionButton(
        child: Icon(Icons.remove), 
          onPressed: _quitar),
      SizedBox(width: 5.0),
      FloatingActionButton(
        onPressed: _agregar,
        child: Icon(Icons.add))
    ]);
  }

  void _agregar(){
    setState(() {
      _conteo++;
    });
  }

  void _quitar(){
    setState(() => _conteo--);
  }

  void _resetear(){
    setState(() => _conteo = 0);
  }
}
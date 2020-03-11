import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSeleccionado = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Expanded(child: _crearImagen())
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valorSeleccionado,
      min: 10,
      max: 400,
      onChanged: (valor){
        setState(() {
          _valorSeleccionado = valor;
        });
      }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://jorgecaze.com/wp-content/gallery/landscapes/JC_landscapes_0020.JPG'),
      width: _valorSeleccionado,
      fit: BoxFit.contain
    );
  }
}
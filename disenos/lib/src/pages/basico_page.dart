import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 20.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        _crarImagen(),
        _crearTitulo(),
        _crearAcciones(),
        _crearTexto(),
        _crearTexto(),
        _crearTexto()
      ]),
    ));
  }

  Widget _crarImagen() {
    return Container(
      width: double.infinity,
      child: Image(
          image: NetworkImage(
              'https://lacf.ca/sites/default/files/images/homepage/banners/P14%20-%20brightcropped%20for%20landing%20page_%20Bridge%20in%20Gablenz%2C%20Germany%2C%20Photo%20by%20Martin%20Damboldt%20from%20Pexels.jpg'),
          height: 200.0,
          fit: BoxFit.cover),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Lago con un puente', style: estiloTitulo),
              SizedBox(height: 7.0),
              Text('Se encuentra en alemania', style: estiloSubTitulo)
            ]),
          ),
          Icon(Icons.star, color: Colors.red, size: 30.0),
          Text('41', style: TextStyle(fontSize: 20.0))
        ]),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE')
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
            'Ut eiusmod eu sunt dolor amet ex in aliqua nostrud do amet dolore amet. Non fugiat excepteur adipisicing occaecat veniam tempor amet pariatur fugiat velit do. Non dolor non consectetur aliquip sint voluptate excepteur aute sint ex ullamco duis elit. Velit aute aute ea laboris et sint dolore. Do eiusmod eiusmod aliquip duis irure proident non laboris est sint minim.Elit esse aute et incididunt quis non adipisicing quis eu ut magna. Proident dolore proident laboris deserunt labore. Labore quis officia aute nostrud.',
            textAlign: TextAlign.justify),
      ),
    );
  }
}

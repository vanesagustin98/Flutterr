import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:qrreaderapp1/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();

  String tipoMapa = 'streets-v11';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Corrdenadas QR'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              map.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(center: scan.getLatLng(), zoom: 15),
      layers: [_crearMapa(), _crearMaracadores(scan)],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate:
            'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoidmFuZXNhZ3VzdGluOTgiLCJhIjoiY2tnMWlmeTU1MG1mYTJycGdrdmtyeTRsZyJ9.U45XdR8L8_7wv_DYxP_ZNg',
          'id': 'mapbox/$tipoMapa'
          //streets-v11, dark-v10, light-v10, outdoors-v11, satellite-v9, satellite-streets-v11
        });
  }

  _crearMaracadores(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
        width: 100.0,
        height: 100.0,
        point: scan.getLatLng(),
        builder: (context) => Container(
          child: Icon(
            Icons.location_on,
            size: 70.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      )
    ]);
  }

  Widget _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        setState(() {
          if (tipoMapa == 'streets-v11') {
            tipoMapa = 'dark-v10';
          } else if (tipoMapa == 'dark-v10') {
            tipoMapa = 'light-v10';
          } else if (tipoMapa == 'light-v10') {
            tipoMapa = 'outdoors-v11';
          } else if (tipoMapa == 'outdoors-v11') {
            tipoMapa = 'satellite-streets-v11';
          } else {
            tipoMapa = 'streets-v11';
          }
        });
        //streets-v11, dark-v10, light-v10, outdoors-v11, satellite-v9, satellite-streets-v11
      },
    );
  }
}

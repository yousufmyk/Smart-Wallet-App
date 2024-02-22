import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearByScreen extends StatefulWidget {
  const NearByScreen({Key? key}) : super(key: key);

  @override
  State<NearByScreen> createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6941,72.9734), zoom: 14.4746);


List <String> points = ["1","2","3","4"];
  final List<Marker> _marker = <Marker>[];
  final List<LatLng> _latlang = <LatLng> [
    LatLng( 33.6941, 72.9734),LatLng( 33.7000, 72.9682),
    LatLng( 33.6992, 72.9744),LatLng(  33.6939, 72.9771
),
  ];
  List<Marker> _list = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(13.0835914, 80.23968144),
    )
  ];

  loadData() {
    for (int i = 0; i < points.length; i++) {
      _marker.add(
        Marker(markerId: MarkerId(i.toString()),
        position: _latlang[i],
        icon: BitmapDescriptor.defaultMarker,
        )
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.hybrid,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_marker),
      ),
    );
  }
}

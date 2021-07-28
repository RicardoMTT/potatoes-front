import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchGaragesInMapScreenMap extends StatefulWidget {
  final double latitudeMap;
  final double longitudeMap;
  const SearchGaragesInMapScreenMap(
      {Key key, this.latitudeMap = 0.0, this.longitudeMap = 0.0})
      : super(key: key);
  @override
  State<SearchGaragesInMapScreenMap> createState() =>
      SearchGaragesInMapScreenMapState();
}

class SearchGaragesInMapScreenMapState
    extends State<SearchGaragesInMapScreenMap> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _myPosition = const LatLng(37.42796133580664, -122.085749655962);

  // LatLng _myPosition;
  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    if (widget.latitudeMap == 0.0 && widget.longitudeMap == 0.0) {
      _getMyPosition();
    } else {
      setState(() {
        _myPosition = LatLng(widget.latitudeMap, widget.longitudeMap);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: _myPosition, zoom: 15),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onCameraMove: (CameraPosition cameraPosition) {},
          onTap: (position) {
            // mapController.latitud.value = position.latitude;
            // mapController.longitud.value = position.longitude;
            createCurrentMarker(position);
          },
          markers: {
            _positionMarker(
              '1',
              _myPosition.latitude,
              _myPosition.longitude,
            )
          },
          zoomControlsEnabled: true,
        ),
        Column(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _getMyPosition();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_searching,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                margin: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Get.back();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    'Guardar ubicación',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.blue,
                )),
          ],
        ),
      ],
    );
  }

  void createCurrentMarker(LatLng position) async {
    final Marker newMarker =
        _positionMarker("123", position.latitude, position.longitude);
    setState(() {
      _myPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Marker _positionMarker(String id, double latitude, double longitude,
      [String iconUrl, double iconWidth = 18, double iconHeight = 40]) {
    _setMarkerIcon(iconUrl, iconWidth, iconHeight);
    log('$_markerIcon');

    return Marker(
        markerId: MarkerId(id),
        position: LatLng(latitude, longitude),
        icon: _markerIcon,
        onTap: () {});
  }

  void _getMyPosition() async {
    final Position _position = await _determinePosition();
    setState(() {
      _myPosition = LatLng(_position.latitude, _position.longitude);
    });
    //Mover Cámara a la posicion actual
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _myPosition, zoom: 15)));
  }

  void _setMarkerIcon(
      [String iconUrl, double iconWidth, double iconHeight]) async {
    if (iconUrl != null) {
      final BitmapDescriptor _icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(iconWidth, iconHeight)), iconUrl);
      setState(() {
        _markerIcon = _icon;
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator
        .isLocationServiceEnabled(); // Verifica si este disp. tiene los servicios de ubicacion habilitados
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator
        .checkPermission(); // El usuario de permisos de ubicación
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    return await Geolocator.getCurrentPosition();
  }
}

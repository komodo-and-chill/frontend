import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:frontend/config.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:geocoder/geocoder.dart';

const kGoogleApiKey = "AIzaSyDdpJUJkKCejIjqHZvAtCgwebWmmZjOITQ";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class Right extends StatefulWidget{
  RightState createState() => RightState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class RightState extends State<Right> {
  Mode _mode = Mode.overlay;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Select Address'),
                onPressed: () async {
                  Prediction p = await PlacesAutocomplete.show(
                    context: context, apiKey: kGoogleApiKey);
                    displayPrediction(p);
                },
              ),
            ],
          )
        ],
      )


    );
  }
  Future<double> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail = 
      await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      return lat;
      return lng; 
    }
  }

  Future <void> _Autocomplete() async {
    Prediction p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: Mode.overlay,
        language: 'en',
        components: [Component(Component.country, 'uk')]
);
  }
}
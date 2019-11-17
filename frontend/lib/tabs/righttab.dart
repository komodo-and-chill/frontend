import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
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
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Location'),
                      Text('Test'),
                      SizedBox(
                        width: 300.0,
                        height: 75.0,
                        child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                        ),
                        child: Text('Select Address', style: TextStyle(fontSize: 25.0)),
                        onPressed: () async {
                          Prediction p = await PlacesAutocomplete.show(
                            context: context, apiKey: kGoogleApiKey);
                            displayPrediction(p);
                        },
                      ),
              ),
                    ],
                  ),
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
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';
import '../api.dart';

const kGoogleApiKey = "AIzaSyAsdTqCgH9IL_S7X40SnKQLTpKxMx4YFTQ";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class Right extends StatefulWidget{
  RightState createState() => RightState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class RightState extends State<Right> {
  Mode _mode = Mode.overlay;

  String _desc = "";

  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.pink[800],
            Colors.pink[500],
            Colors.pink[300],
            Colors.purple[100],
          ],
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent ,
        key: homeScaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 50.0)],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 2.0, color: Colors.black12
                      )
                    ),
                    height: 400,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                        child:Text('Location', style: TextStyle(fontSize: 30.0)),
                        ),
                        SizedBox(
                          child: Text('$_desc', style: TextStyle(fontSize: 30.0))),
                        SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black38)
                          ),
                          child: Text('Select Address', style: TextStyle(fontSize: 20.0)),
                          onPressed: () async {
                            Prediction p = await PlacesAutocomplete.show(
                              context: context, apiKey: kGoogleApiKey);
                              var addr = await handlePrediction(p);
                              var data = await apiMaps(addr);

                              setState(() {
                                this._desc = data;
                              });
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


      ),
    );
  }
  Future<String> handlePrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail = 
      await _places.getDetailsByPlaceId(p.placeId);

      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      return lat.toString() + "," + lng.toString();
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
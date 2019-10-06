import 'package:flutter/material.dart';
import 'package:tourist/widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'package:tourist/screens/location_detail/text_section.dart';
import '../../models/location.dart';


class LocationDetail extends StatelessWidget {
  final int _locationId;

  LocationDetail(this._locationId);
  @override
  Widget build(BuildContext context) {
    // fetch the first location we have 
    // NOTE: move this toa scoped model later
    final location  = Location.fetchByID(_locationId);

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ImageBanner(assetPath: location.imagePath),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
              child: LocationTile(location: location,),
            )
          ]..addAll(textSection(location))
        ),
      ),
    );
  }
  // function that returns locations
  List<Widget> textSection(Location location){
    return location.facts.map((fact) => TextSection(fact.title, fact.text)).toList();
  }
}

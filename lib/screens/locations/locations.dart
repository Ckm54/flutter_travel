import 'package:flutter/material.dart';
import 'package:tourist/screens/locations/tile_overlay.dart';
import 'package:tourist/widgets/image_banner.dart';
import '../../app.dart';
import 'package:tourist/models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NOTE: move this to a scoped model later
    final locations = Location.fetchAll();

    return Scaffold (
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) => _itemBuilder(context, locations[index]),
      ),
    );
  }
  _onLocationTap(BuildContext context, int locationId){
    Navigator.pushNamed(context,LocationDetailRoute,
        arguments: {'id': locationId});
  }
  Widget _itemBuilder(BuildContext context, Location location){
    return  GestureDetector(
    onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 245.0,
          child: Stack(
          children: [
            ImageBanner(assetPath: location.imagePath, height: 245.0),
            TileOverlay(location),
          ]
      )));
  }
}

import 'package:flutter/material.dart';
import 'package:tourist/models/location.dart';

import '../style.dart';

const LocationTileHeight = 100.0;

class LocationTile extends StatelessWidget {
  final Location location;
  final bool darkTheme;

  // parameters in curly braces means they are optional parameters
  LocationTile({this.location, this.darkTheme = false});
  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: LocationTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            location.name.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:
            Theme.of(context).textTheme.title.copyWith(color: textColor),
          ),
          Text(
            location.userItinerarySummary.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle,
          ),
          Text(
            location.tourPackageName.toUpperCase(),
            style: Theme.of(context).textTheme.caption.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}

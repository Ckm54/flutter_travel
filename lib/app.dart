import 'package:flutter/material.dart';
import 'package:tourist/screens/location_detail/location_detail.dart';
import 'package:tourist/style.dart';
import 'screens/locations/locations.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // get dynamic list of routes
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }
  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name){
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: AppBarTextStyle),
        ),
        textTheme: TextTheme(
          title: TitleTextStyle,
          subtitle: SubtitleTextStyle,
          caption: CaptionTextStyle,
          body1: Body1TextStyle,
        )
    );
  }
}

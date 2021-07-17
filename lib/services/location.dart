import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/services/networking.dart';

class Location {
  double long , lat;


  Location();

  Future<void> getLocation()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('position => ' + position.latitude.toString());
    long = position.latitude;
    lat = position.latitude;


  }




}
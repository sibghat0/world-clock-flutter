import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //time in that location
  String flag;  //url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false for day time

  WorldTime({ this.location, this.url, this.flag });

  Future<void> getTime() async{
  try {
  Response response = await get('https://worldtimeapi.org/api/timezone/$url');
  Map data = json.decode(response.body);
  // print(data);

  //get properties from data
  String datetime = data["datetime"];
  String offsetHour = data["utc_offset"].substring(1,3);
  String offsetMin = data["utc_offset"].substring(4,6);
  // print(datetime);
  // print(offset);
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offsetHour)));
  now = now.add(Duration(minutes: int.parse(offsetMin)));
  // print(date);
  //set the time property
  isDaytime = now.hour > 6 && now.hour < 18 ? true : false ;
  time = DateFormat.jm().format(now);

  }
  catch (e) {
    print('Error caught : $e');
    time = 'could not update the time';
  }
  }

}
import 'package:http/http.dart' as http;
import 'dart:convert';

class worker{

  String location;

  //Constructor
  worker({required this.location})
  {
    location = this.location;
  }

  String temp='';
  String humidity='';
  String air_speed='';
  String description='';
  String main='';

  //method

  Future<void> getData() async
  {
    final Uri uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=91a242de7c53d00339e77083c741f572');
    final http.Response response = await http.get(uri);
    // Response response= await get("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=91a242de7c53d00339e77083c741f572");
    Map data= jsonDecode(response.body); // json se hum ek single data le skte h

    //Getting Temp,Humidity,airspeed
    Map temp_data = data['main'];
    String getHumidity = temp_data['humidity'].toString();
    double getTemp = temp_data['temp_data'];

    //Getting airspeed
    Map wind = data['wind'];
    double getAir_speed = wind['speed'];


    //Getting Description
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getMain_des = weather_main_data['main'];
    String getDesc = weather_main_data['description'];

    //Assigning Values
    temp = getTemp.toString();
    humidity = getHumidity;
    air_speed = getAir_speed.toString();
    description = getDesc;
    main = getMain_des;


  }


  // void getData() async {
  //   final url = 'https://api.openweathermap.org/data/2.5/weather?q=delhi&appid=91a242de7c53d00339e77083c741f572';
  //
  //   // Convert the String URL to a Uri object
  //   final uri = Uri.parse(url);
  //
  //   // Use the Uri object in the get request
  //   final response = await http.get(uri);
  //
  //   if (response.statusCode == 200) {
  //     Map data = jsonDecode(response.body);
  //     Map tempData = data['main'];
  //     double temp = tempData['temp']; // Correct key for temperature
  //     print(temp);
  //   } else {
  //     print('Error fetching data: ${response.statusCode}');
  //   }
  // }

}

worker instance = worker(location: 'Delhi');
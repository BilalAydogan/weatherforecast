import 'package:flutter/material.dart';
import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  final String _cityName = "corum";
  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    /* forecastObject.then((Weather) => {print(Weather.list[0].weather[0].main)}); */
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      children: <Widget>[
        textFieldView(),
        Container(
          child: FutureBuilder(future: forecastObject, 
          builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) { 
            if(snapshot.hasData){
              return Text("All good");
            }else{
              return Container(
                child: Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
           },),
        )
      ],
    ),
  );
}

Widget textFieldView() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
          hintText: "Enter City Name",
          prefix: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8)),
      onSubmitted: (value) {},
    ),
  );
}



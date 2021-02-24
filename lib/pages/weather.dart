import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  String namakota;
  String main;
  String description;
  String temp;
  String feels_like;
  String temp_min;
  String temp_max;
  String pressure;
  String humidity;

  Weather(
      {this.namakota,
      this.main,
      this.description,
      this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text("Cuaca Saat Ini Di : " + widget.namakota),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.my_location,
                        size: 26.0, color: Colors.white),
                  )),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Umumnya : " + widget.main,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Keterangan Lanjut : " + widget.description,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Temperatur (°K): " + widget.temp,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Terasa Seperti (°K): " + widget.feels_like,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Temperatur Terendah (°K): " + widget.temp_min,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Temperatur Tertinggi (°K): " + widget.temp_max,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Tekanan Udara (mb): " + widget.pressure,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                    child: Text(
                  "Kelembapan (%): " + widget.humidity,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.2
                      ..color = Colors.white,
                  ),
                )),
              ),
            ],
          )),
    );
  }
}

import 'package:e_weather/model/data.dart';
import 'package:e_weather/pages/weather.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController input1 = TextEditingController();
  Cuaca data1 = null;
  Cuaca data2 = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Aplikasi Ramalan Cuaca ",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("E-Weather Forecast App"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Container(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        // child: Image.asset("images/masjid.jpg"),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: 250.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn),
                          items: [
                            "surabaya1.jpg",
                            "surabaya2.jpg",
                            "surabaya3.jpg"
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35.0),
                                    child: Image.asset("images/$i"),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        )),
                  ),
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text(
                    " Selamat Datang di Aplikasi Ramalan Cuaca ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(" "),
                  Text(
                    " Masukkan Lokasi :  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: input1,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.location_on),
                            hintText: 'Lokasi Anda',
                            labelText: 'Lokasi',
                          ),
                          validator: (String value) {
                            return value.contains('@')
                                ? 'Jangan diisi dengan @'
                                : null;
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: RaisedButton(
                    onPressed: () {
                      Cuaca.connectToAPI(input1.text).then((value) {
                        data1 = value;
                      });
                      Cuaca.connectToAPI2(input1.text).then((value2) {
                        data2 = value2;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Weather(
                          namakota: input1.text,
                          main: data1.main,
                          description: data1.description,
                          temp: data2.temp,
                          feels_like: data2.feels_like,
                          temp_min: data2.temp_min,
                          temp_max: data2.temp_max,
                          pressure: data2.pressure,
                          humidity: data2.humidity,
                        );
                      }));
                    },
                    child: Icon(Icons.search),
                  )),
                  Container(
                      child: RaisedButton(
                    onPressed: () {
                      return new MaterialApp(
                        theme: new ThemeData(
                          scaffoldBackgroundColor: Colors.blue[900],
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

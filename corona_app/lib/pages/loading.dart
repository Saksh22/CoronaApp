import 'package:flutter/material.dart';
import 'package:coronaapp/services/world_count.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  

  
  void setupWorldCount() async{

    WorldCount instance = WorldCount(url: 'india',location: 'India',flag: 'india.png');
    await instance.getCount();
    Navigator.pushReplacementNamed(context, '/homepage');
//    , arguments:{
//
//      'location': instance.location,
//      'confirmed': instance.confirmed,
//      'flag': instance.flag,
//      'deaths': instance.deaths,
//      'recovered': instance.recovered,
//    });




  }


  @override
  void initState() {
    super.initState();
    setupWorldCount();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Center(
          child: SpinKitPumpingHeart(
            color: Colors.white70,
            size: 80.0,
          ),
      ),



    );
  }
}

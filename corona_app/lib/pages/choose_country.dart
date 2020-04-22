import 'package:coronaapp/services/world_count.dart';
import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldCount> locations =[

    WorldCount(url: 'india',location:'India',flag: 'india.png'),
    WorldCount(url: 'italy',location:'Italy',flag: 'italy.png'),
    WorldCount(url: 'china',location:'China',flag: 'china.png'),
    WorldCount(url: 'usa',location:'Usa',flag: 'usa.png'),
    WorldCount(url: 'spain',location:'Spain',flag: 'spain.png'),

  ];

  void updateCount(index) async{

    WorldCount instance = locations[index];
    await instance.getCount();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': instance.location,
      'confirmed': instance.confirmed,
      'flag': instance.flag,
      'deaths': instance.deaths,
      'recovered': instance.recovered,

    });

  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: Text("Choose Country"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateCount(index);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(

                    fontSize: 18.0,



                ),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),

              ),
            ),
          );
        },
      ),
    );
  }
}

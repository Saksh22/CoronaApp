import 'package:coronaapp/services/world_count.dart';
import 'package:flutter/material.dart';
import 'package:coronaapp/services/world_count.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String confirmed;
  String recovered;
  String deaths;

 void setUpTotal() async{

   WorldCount instance= WorldCount();
   await instance.getTotal();
   //print(instance.totDeaths);
   setState(() {
     confirmed=instance.totalConfirmed;
     recovered=instance.totalRecovered;
     deaths=instance.totalDeaths;


   });

 }



  @override
  @override
  void initState() {
    super.initState();
    setUpTotal();
  }

  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
          backgroundColor: Colors.teal[800],
        title: Text('CoronaVirus Update'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');


                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('View By Country',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),)),
              SizedBox(height: 10.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                        'World Count:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                          letterSpacing: 2.0,
                          color: Colors.teal[800],
                        ),
                  ),
                ],

              ),
              SizedBox(height: 20.0),
              SizedBox(height: 25.0),
              Text('Confirmed Cases :',
                style: TextStyle(
                  fontSize: 20.0,


                ),
              ),
              Text(
                confirmed,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.blueGrey,
                ),
              ),

              SizedBox(height: 17.0),
              Text('Recoveries :',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                recovered,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 17.0),
              Text('Deaths :',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                deaths,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.blueGrey,
                ),
              ),




            ],
          ),


        ),
      )
    );
  }
}

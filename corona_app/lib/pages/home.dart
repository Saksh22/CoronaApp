import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Map data={};

  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text('Corona Virus Update'),
        backgroundColor: Colors.teal[800],
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,100.0,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result=await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'confirmed': result['confirmed'],
                          'recovered': result['recovered'],
                          'deaths': result['deaths'],
                          'location': result['location'],
                          'flag': result['flag'],

                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),)
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 50.0,
                        letterSpacing: 2.0,
                        color: Colors.teal[800],
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 25.0),
                Text('Confirmed Cases :',
                  style: TextStyle(
                    fontSize: 20.0,


                  ),
                ),
                Text(
                  data['confirmed'],
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
                  data['recovered'],
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
                  data['deaths'],
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blueGrey,
                  ),
                )


              ],
            ),
          )
      ),
    );
  }
}

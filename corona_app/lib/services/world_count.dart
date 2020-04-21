import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WorldCount {

String location; // location name for UI
String confirmed;
String recovered;
String deaths;// the time in that location
String flag; // url to an asset flag icon
String url; // location url for api endpoint


WorldCount({ this.url,this.location, this.flag });

 Future<void> getCount() async {


   try{
     final response = await get('https://covid-19-data.p.rapidapi.com/country?format=json&name=$url',
         headers: {"x-rapidapi-host": "covid-19-data.p.rapidapi.com",
           "x-rapidapi-key": "2c78b78cc4mshe3e315d3a9559ebp139f60jsnaa8c187ec2c7"});
     print(response.body);


     final data = jsonDecode(response.body);
     var intConfirmed = data.map<int>((m) => m['confirmed'] as int).toList();
     var intRecovered = data.map<int>((m) => m['recovered'] as int).toList();
     var intDeaths = data.map<int>((m) => m['deaths'] as int).toList();

     confirmed= intConfirmed[0].toString();
     recovered = intRecovered[0].toString();
     deaths = intDeaths[0].toString();
//    print(confirmed);

   }
   catch (e){
     print(e);

   }








}

}

